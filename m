Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877C0C4708E
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jan 2023 18:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QPnK4nR9YOFuIJBLiCDdjRYx3zdNP6L+AXzagnnP3Jo=; b=27wQqK30i/6yuM
	3/maHzv4p3VF79IfNtucZVWkuATwVDVqfzqpGNvTLvveGQTsbkCdCAToRdwrzcIN9JVNMtkUPFUgt
	TAGJVLL1ksISl2eC35xD32c2VNZSIviALW9jj4iHXt6UKjU/RS03hje5NTI94xSQ+adwErVE0yGPU
	9gni5KPjv5v47Ixs15tTI9FHPmntcEfjl0Ipr8d6MKfuBfLjeQNAABbllS7ApSgdABWdc82+kzMt0
	zQXQpWd/eQTnj6QR1r1UPy80Vg8B/uPNexvesZQqkOVYdx0purZCN19nseMHArZwnZnGTAcoA6CQQ
	Ebd0SB9L4p02Up3F+8aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCPB4-00DL5r-8m; Mon, 02 Jan 2023 18:04:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCPAL-00DKw8-66
	for linux-riscv@lists.infradead.org; Mon, 02 Jan 2023 18:04:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5CE8661083;
	Mon,  2 Jan 2023 18:04:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7792BC433EF;
	Mon,  2 Jan 2023 18:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672682642;
	bh=ifUmvfCBh29zQ+7sIS0FtN5zIwsm2GSxNWtY9yy8c4o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CWlZVqjHHqwr8igQKlHq+PKv2KHgcqIsxp0z/xZHqVoCFIOsyD9SMDKk8ri94/+4E
	 DeX13VcOX6va985fIXJ90DjcQM0/aTDjt9Aof6+DlL327kNH9LJPPFWudEA1IK0BhS
	 lUg/mr31F/mkalwM4E6kUeOr1t9ZlokDe+96ZSIa70sQf8AEPVtXRWMyGKv9LqwKrI
	 3NK7H4yDG8OdWf25FNF5ZkawSGsl4jCslz+jib4oPDyRhWVNamV9AxWXxOpjvoQ+JY
	 R6QhIsLAxrPKUQRW+06UNZ3i9DpK3Ivsivk3YaZnxe8D7pjZTdZGgxYddhzEC0XXYL
	 8kvNfsTwkNOdQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Chen Guokai <chenguokai17@mails.ucas.ac.cn>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, rostedt@goodmis.org,
 mingo@redhat.com, sfr@canb.auug.org.au
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 liaochang1@huawei.com, Chen Guokai <chenguokai17@mails.ucas.ac.cn>
Subject: Re: [PATCH v5 6/9] riscv/kprobe: Add code to check if kprobe can be
 optimized
In-Reply-To: <20221224114315.850130-7-chenguokai17@mails.ucas.ac.cn>
References: <20221224114315.850130-1-chenguokai17@mails.ucas.ac.cn>
 <20221224114315.850130-7-chenguokai17@mails.ucas.ac.cn>
Date: Mon, 02 Jan 2023 19:04:00 +0100
Message-ID: <87sfgsvmnj.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_100405_333982_3CD54461 
X-CRM114-Status: GOOD (  12.97  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Q2hlbiBHdW9rYWkgPGNoZW5ndW9rYWkxN0BtYWlscy51Y2FzLmFjLmNuPiB3cml0ZXM6Cgo+IEZy
b206IExpYW8gQ2hhbmcgPGxpYW9jaGFuZzFAaHVhd2VpLmNvbT4KCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9vcHQuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9v
cHQuYwo+IGluZGV4IGEwZDJhYjM5ZTNmYS4uMjU4YTI4M2M5MDZkIDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9vcHQuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3By
b2Jlcy9vcHQuYwo+IEBAIC0yNzEsMTUgKzI3MSwxMDMgQEAgc3RhdGljIHZvaWQgZmluZF9mcmVl
X3JlZ2lzdGVycyhzdHJ1Y3Qga3Byb2JlICprcCwgc3RydWN0IG9wdGltaXplZF9rcHJvYmUgKm9w
LAo+ICAJKnJhID0gKGt3ID09IDFVTCkgPyAwIDogX19idWlsdGluX2N0emwoa3cgJiB+MVVMKTsK
PiAgfQo+ICAKPiArc3RhdGljIGJvb2wgaW5zbl9qdW1wX2ludG9fcmFuZ2UodW5zaWduZWQgbG9u
ZyBhZGRyLCB1bnNpZ25lZCBsb25nIHN0YXJ0LAo+ICsJCQkJIHVuc2lnbmVkIGxvbmcgZW5kKQo+
ICt7Cj4gKwlrcHJvYmVfb3Bjb2RlX3QgaW5zbiA9ICooa3Byb2JlX29wY29kZV90ICopYWRkcjsK
PiArCXVuc2lnbmVkIGxvbmcgdGFyZ2V0LCBvZmZzZXQgPSBHRVRfSU5TTl9MRU5HVEgoaW5zbik7
Cj4gKwo+ICsjaWZkZWYgQ09ORklHX1JJU0NWX0lTQV9DCj4gKwlpZiAob2Zmc2V0ID09IFJWQ19J
TlNOX0xFTikgewo+ICsJCWlmIChyaXNjdl9pbnNuX2lzX2NfYmVxeihpbnNuKSB8fCByaXNjdl9p
bnNuX2lzX2NfYm5leihpbnNuKSkKPiArCQkJdGFyZ2V0ID0gYWRkciArIHJ2Y19icmFuY2hfaW1t
ZShpbnNuKTsKPiArCQllbHNlIGlmIChyaXNjdl9pbnNuX2lzX2NfamFsKGluc24pIHx8IHJpc2N2
X2luc25faXNfY19qKGluc24pKQo+ICsJCQl0YXJnZXQgPSBhZGRyICsgcnZjX2phbF9pbW1lKGlu
c24pOwo+ICsJCWVsc2UKPiArCQkJdGFyZ2V0ID0gMDsKPiArCQlyZXR1cm4gKHRhcmdldCA+PSBz
dGFydCkgJiYgKHRhcmdldCA8IGVuZCk7Cj4gKwl9Cj4gKyNlbmRpZgo+ICsKPiArCWlmIChyaXNj
dl9pbnNuX2lzX2JyYW5jaChpbnNuKSkKPiArCQl0YXJnZXQgPSBhZGRyICsgcnZpX2JyYW5jaF9p
bW1lKGluc24pOwo+ICsJZWxzZSBpZiAocmlzY3ZfaW5zbl9pc19qYWwoaW5zbikpCj4gKwkJdGFy
Z2V0ID0gYWRkciArIHJ2aV9qYWxfaW1tZShpbnNuKTsKPiArCWVsc2UKPiArCQl0YXJnZXQgPSAw
Owo+ICsJcmV0dXJuICh0YXJnZXQgPj0gc3RhcnQpICYmICh0YXJnZXQgPCBlbmQpOwo+ICt9Cj4g
Kwo+ICtzdGF0aWMgaW50IHNlYXJjaF9jb3BpZWRfaW5zbih1bnNpZ25lZCBsb25nIHBhZGRyLCBz
dHJ1Y3Qgb3B0aW1pemVkX2twcm9iZSAqb3ApCj4gK3sKPiArCWludCBpID0gIDE7Cj4gKwl1bnNp
Z25lZCBsb25nIG9mZnNldCA9IEdFVF9JTlNOX0xFTkdUSCgqKGtwcm9iZV9vcGNvZGVfdCAqKXBh
ZGRyKTsKPiArCj4gKwl3aGlsZSAoKGkrKyA8IE1BWF9DT1BJRURfSU5TTikgJiYgKG9mZnNldCA8
IDIgKiBSVklfSU5TTl9MRU4pKSB7Cj4gKwkJaWYgKHJpc2N2X3Byb2JlX2RlY29kZV9pbnNuKChw
cm9iZV9vcGNvZGVfdCAqKXBhZGRyICsgb2Zmc2V0LAo+ICsJCQkJCSAgICBOVUxMKSAhPSBJTlNO
X0dPT0QpCgpJZiB0aGUgc2Vjb25kIGFyZ3VtZW50IGlzIE5VTEwsIGFuZCB0aGUgaW5zbiBpcyBh
dWlwYywgd2UnbGwgc3BsYXQgd2l0aApOVUxMLXB0ciBleGNlcHRpb24uCgpIbW0sIHByb2JlX29w
Y29kZV90IGlzIHUzMiwgcmlnaHQ/IEFuZCBHRVRfSU5TTl9MRU5HVEgoKSByZXR1cm5zIDQgb3Ig
MgouLi50aGVuIHRoZSBwb2ludGVyIGFyaXRobWV0aWMgd2lsbCBiZSBhIG1lc3M/CgoKQmrDtnJu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
