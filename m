Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F0FC4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Nov 2022 16:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TrKL43CKvq6k4Z7RhLrinMEuuU41p9B9TCEp52/NU40=; b=GblQKMvfijbm/L
	22nv6X2VyWW9b9ZS+Zs8IgxR2P1ZYeti7J8ExWjY7Gb8fIFwecqlQi8qgDMWZjq8NbdNZqzR4NGZp
	6IF8xNG2/yCewrr7YotjFdIm9NUYP2+JndSpZ0FFa6okmpCGw++ZBY/2thWvPqj+2a6FY/xCKWIuK
	mb4RlyVKZ9vrdcTFB2g7+j+MxDoMqtb+c6vdlpCHk+o5u8ss3bj3i31cN51YO0q/caJXWRL2B4kZG
	XDUTvfzKIhbg9o7FcNBthNax+ER9rilo9jL2sNp3Cy26ZvVTB1TH169cEjyea9DQYe5sHJbczuJ8v
	F1k/sztjPcD7/2xD8PGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os5Pu-00GRpj-Ql; Mon, 07 Nov 2022 16:56:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os5Ps-00GRnr-FL
	for linux-riscv@lists.infradead.org; Mon, 07 Nov 2022 16:56:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0DF6D611C6;
	Mon,  7 Nov 2022 16:56:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25903C433D6;
	Mon,  7 Nov 2022 16:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667840167;
	bh=pnyl9ZpInkkIrifXkuZxEpTl9OIUwhuPakxK4echwoU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=uDayzqo4JFxbQbxSN4/X/creKMzVS+AWMg/Jj9ta5qzISdtF8uG4v1Ms+sAi9C3fG
	 5DwENLzEQyD9aAnjkbcxwJfWuhtp8RICFHy/jCO76xPu3HAPx2cvGV589EQ8A7Ikdc
	 1MffGd/cMLS1G5a+nZ0OR264xr+S3K5QCQnJxV97wGtSoSMJZpD6SYbYl5ldby2T0e
	 zxENeHrkrnLtMDghJ2HDMkT2fpG2UW6YtA7rzTh9WNGarnWr7bpZuwNRR3o2rAS4R1
	 gJ5JrwIFy6IMbFGZTR744jEBmwmSeqomCbYqop5EOS4BKXIKavFgR1w5doHSCCibsX
	 0+KTS5QZuVZMQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Chen Guokai <chenguokai17@mails.ucas.ac.cn>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, rostedt@goodmis.org,
 mingo@redhat.com, sfr@canb.auug.org.au
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 liaochang1@huawei.com, Chen Guokai <chenguokai17@mails.ucas.ac.cn>
Subject: Re: [PATCH v4 6/8] riscv/kprobe: Add code to check if kprobe can be
 optimized
In-Reply-To: <20221106100316.2803176-7-chenguokai17@mails.ucas.ac.cn>
References: <20221106100316.2803176-1-chenguokai17@mails.ucas.ac.cn>
 <20221106100316.2803176-7-chenguokai17@mails.ucas.ac.cn>
Date: Mon, 07 Nov 2022 17:56:04 +0100
Message-ID: <87v8nq1z6j.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_085608_572422_861C896E 
X-CRM114-Status: GOOD (  18.40  )
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

Q2hlbiBHdW9rYWkgPGNoZW5ndW9rYWkxN0BtYWlscy51Y2FzLmFjLmNuPiB3cml0ZXM6CgpbLi4u
XQoKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL29wdC5jIGIvYXJjaC9y
aXNjdi9rZXJuZWwvcHJvYmVzL29wdC5jCj4gaW5kZXggNmQyM2M4NDM4MzJlLi44NzZiZWM1Mzk1
NTQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL29wdC5jCj4gKysrIGIv
YXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL29wdC5jCgpbLi4uXQoKPiAgLyoKPiAtICogSWYgdHdv
IGZyZWUgcmVnaXN0ZXJzIGNhbiBiZSBmb3VuZCBhdCB0aGUgYmVnaW5uaW5nIG9mIGJvdGgKPiAt
ICogdGhlIHN0YXJ0IGFuZCB0aGUgZW5kIG9mIHJlcGxhY2VkIGNvZGUsIGl0IGNhbiBiZSBvcHRp
bWl6ZWQKPiAtICogQWxzbywgaW4tZnVuY3Rpb24ganVtcHMgbmVlZCB0byBiZSBjaGVja2VkIHRv
IG1ha2Ugc3VyZSB0aGF0Cj4gLSAqIHRoZXJlIGlzIG5vIGp1bXAgdG8gdGhlIHNlY29uZCBpbnN0
cnVjdGlvbiB0byBiZSByZXBsYWNlZAo+ICsgKiBUaGUga3Byb2JlIGNhbiBiZSBvcHRpbWl6ZWQg
d2hlbiBubyBpbi1mdW5jdGlvbiBqdW1wIHJlYWNoZXMgdG8gdGhlCj4gKyAqIGluc3RydWN0aW9u
cyByZXBsYWNlZCBieSBvcHRpbWl6ZWQganVtcCBpbnN0cnVjdGlvbnMoQVVJUEMvSkFMUikuCj4g
ICAqLwo+ICBzdGF0aWMgYm9vbCBjYW5fb3B0aW1pemUodW5zaWduZWQgbG9uZyBwYWRkciwgc3Ry
dWN0IG9wdGltaXplZF9rcHJvYmUgKm9wKQo+ICB7Cj4gLQlyZXR1cm4gZmFsc2U7Cj4gKwlpbnQg
cmV0Owo+ICsJdW5zaWduZWQgbG9uZyBhZGRyLCBzaXplID0gMCwgb2Zmc2V0ID0gMDsKPiArCXN0
cnVjdCBrcHJvYmUgKmtwID0gZ2V0X2twcm9iZSgoa3Byb2JlX29wY29kZV90ICopcGFkZHIpOwo+
ICsKPiArCS8qCj4gKwkgKiBTa2lwIG9wdGltaXphdGlvbiBpZiBrcHJvYmUgaGFzIGJlZW4gZGlz
YXJtZWQgb3IgaW5zdHJ1bWVudGVkCj4gKwkgKiBpbnN0cnVjdGlvbiBzdXBwb3J0IFhPSS4KPiAr
CSAqLwo+ICsJaWYgKCFrcCB8fCAocmlzY3ZfcHJvYmVfZGVjb2RlX2luc24oJmtwLT5vcGNvZGUs
IE5VTEwpICE9IElOU05fR09PRCkpCj4gKwkJcmV0dXJuIGZhbHNlOwo+ICsKPiArCS8qCj4gKwkg
KiBGaW5kIGEgaW5zdHJ1Y3Rpb24gd2luZG93IGxhcmdlIGVub3VnaCB0byBjb250YWluIGEgcGFp
cgo+ICsJICogb2YgQVVJUEMvSkFMUiwgYW5kIGVuc3VyZSBlYWNoIGluc3RydWN0aW9uIGluIHRo
aXMgd2luZG93Cj4gKwkgKiBzdXBwb3J0cyBYT0kuCj4gKwkgKi8KPiArCXJldCA9IHNlYXJjaF9j
b3BpZWRfaW5zbihwYWRkciwgb3ApOwo+ICsJaWYgKHJldCkKPiArCQlyZXR1cm4gZmFsc2U7Cj4g
Kwo+ICsJaWYgKCFrYWxsc3ltc19sb29rdXBfc2l6ZV9vZmZzZXQocGFkZHIsICZzaXplLCAmb2Zm
c2V0KSkKPiArCQlyZXR1cm4gZmFsc2U7Cj4gKwo+ICsJLyogQ2hlY2sgdGhlcmUgaXMgZW5vdWdo
IHNwYWNlIGZvciByZWxhdGl2ZSBqdW1wKEFVSVBDL0pBTFIpICovCj4gKwlpZiAoc2l6ZSAtIG9m
ZnNldCA8PSBvcC0+b3B0aW5zbi5sZW5ndGgpCj4gKwkJcmV0dXJuIGZhbHNlOwo+ICsKPiArCS8q
Cj4gKwkgKiBEZWNvZGUgaW5zdHJ1Y3Rpb25zIHVudGlsIGZ1bmN0aW9uIGVuZCwgY2hlY2sgYW55
IGluc3RydWN0aW9uCj4gKwkgKiBkb24ndCBqdW1wIGludG8gdGhlIHdpbmRvdyB1c2VkIHRvIGVt
aXQgb3B0cHJvYmUoQVVJUEMvSkFMUikuCj4gKwkgKi8KCkRvbid0IHRoZSBmaXh1cCB0YWJsZXMg
bmVlZCB0byBiZSBjaGVja2VkLCBzaW1pbGFyIHRvIHRoZSB4ODYgY29kZT8KCgpCasO2cm4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
