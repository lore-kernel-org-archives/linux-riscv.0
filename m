Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB57C3DA7A
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jan 2023 18:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cn5VmY5Q/l/hTlwv7E/FcQifnlmNULQL23fIzA42kLA=; b=C9F7l3aiILqwjA
	UAdHg1oJyOLjvfwanWNB+R6e1AxTvUBPWVOrB7x+kuy/BXnkvUm78rqHwWPREvvOgumh5aoBCiUOt
	DsspWy01Y98QwQwCuTnQ36GgsjO8icSLlvW8VazEcCx4npadOPliC/EwpsNzGe2xlQBUeUkPmOCZN
	irSS+kUASxwiDKPrg7GWSztYXEyXO9p0iA3DTvR451DQaZXnmnhe+RzrC72st/0R5oHb9Bgi8vxgd
	thMof/AYUnfW+KuJbuA/t/3wkPyGvgsFQ85cRuZC2pgcXf8Ojy+k7h1NdzTmL8g454XALFX5nvsSr
	CEjcwZNFG5GSenbBhCAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCPAn-00DL1F-Os; Mon, 02 Jan 2023 18:04:33 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCP9e-00DKom-Bw
	for linux-riscv@lists.infradead.org; Mon, 02 Jan 2023 18:03:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EE060B80D9F;
	Mon,  2 Jan 2023 18:03:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 691AFC433D2;
	Mon,  2 Jan 2023 18:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672682599;
	bh=xFB+pqkNVJr5d8mSMRmOujiTSNxhjU4TQhJt9Jg8R8Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nTlYO3nfkttQQtNzmo5st0FF1fLUh3JjCaVhN08ZsFu2/Ar3eRDOzfAvEQFgt7sdV
	 1VwVgLYhgywzHybz+qx+w6R3pBQQ+1xBmPecCZEksyOSyU/mqs03PuEAyj36TqyuFQ
	 ss6xPo+zvoVXRefp20KH+1Ufo3tZcQ8O9Vv2+7bUqV3SGoNlZny2fZSXbXOpKECPOs
	 o/jGZd7b8s0MUGGRqmz/VYLlCulDIq4o+VFIXkQ2rfSod0QNe338OIjxHp+4FjFRGm
	 qe+EkEmhta0pUJSsu1TMvsTcURy5os45fvHYRY7oDp/sJWrxmLQLrlV+ZO9+rH88IT
	 CenFM5oUu0BTQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Chen Guokai <chenguokai17@mails.ucas.ac.cn>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, rostedt@goodmis.org,
 mingo@redhat.com, sfr@canb.auug.org.au
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 liaochang1@huawei.com, Chen Guokai <chenguokai17@mails.ucas.ac.cn>
Subject: Re: [PATCH v5 1/9] riscv/kprobe: Prepare the skeleton to implement
 RISCV OPTPROBES feature
In-Reply-To: <20221224114315.850130-2-chenguokai17@mails.ucas.ac.cn>
References: <20221224114315.850130-1-chenguokai17@mails.ucas.ac.cn>
 <20221224114315.850130-2-chenguokai17@mails.ucas.ac.cn>
Date: Mon, 02 Jan 2023 19:03:17 +0100
Message-ID: <87wn64vmoq.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_100322_598694_A2DFF93B 
X-CRM114-Status: GOOD (  13.87  )
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
b206IExpYW8gQ2hhbmcgPGxpYW9jaGFuZzFAaHVhd2VpLmNvbT4KPgo+IFByZXBhcmUgc2tlbGV0
b24gdG8gaW1wbGVtZW50IG9wdGltaXplZCBrcHJvYmUgb24gUklTQ1YsIGl0IGlzIGNvbnNpc3QK
PiBvZiBNYWtmaWxlLCBLY29uZmlnIGFuZCBzb21lIGFyY2hpdGVjdHVyZSBzcGVjaWZpYyBmaWxl
czoga3Byb2JlLmggYW5kCj4gb3B0LmMgb3B0LmMgaW5jbHVkZSBzb21lIG1hY3JvLCB0eXBlIGRl
ZmluaXRpb24gYW5kIGZ1bmN0aW9ucyByZXF1aXJlZAo+IGJ5IGtwcm9iZSBmcmFtZXdvcmssIG9w
dF90cmFtcG9saW5lLlMgcHJvdmlkZSBhIHBpZWNlIG9mIGFzc2VtYmx5IGNvZGUKPiB0ZW1wbGF0
ZSB1c2VkIHRvIGNvbnN0cnVjdCB0aGUgZGV0b3VyIGJ1ZmZlciBhcyB0aGUgdGFyZ2V0IG9mIGxv
bmcganVtcAo+IGluc3RydWN0aW9uKHMpIGZvciBlYWNoIG9wdGltemVkIGtwcm9iZS4KClRoaXMg
aXMgcHJldHR5IG11Y2gganVzdCByZWl0ZXJhdGluZyB3aGF0IGRpZmYtc3RhdCBzYXlzLiBQbGVh
c2UgdHJ5IHRvCmV4cGxhaW4gd2h5IGEgY2VydGFpbiBjaGFuZ2UgaXMgZG9uZSwgaW5zdGVhZCBv
ZiB3aGF0LiBXaGF0IGlzIGFscmVhZHkKaW4gdGhlIHBhdGNoLgoKPiBTaW5jZSB0aGUganVtcCBy
YW5nZSBvZiBQQy1yZWxhdGl2ZSBpbnN0cnVjdGlvbiBKQUwgaXMgKy8tMk0sIHRoYXQgaXMKPiB0
b28gc21hbGwgdG8gcmVhY2ggdGhlIGRldG91ciBidWZmZXIsIGhlbmNlIHRoZSBmb3VkYW1lbnRh
bCBpZGVhIHRvCj4gYWRkcmVzcyBPUFRQUk9CRVMgb24gUklTQ1YgaXMgcmVwbGFjZSAnRUJSRUFL
JyB3aXRoICdBVUlQQy9KQUxSJy4gd2hpY2gKPiBtZWFucyBpdCBuZWVkcyB0byBjbG9iYmVyIG9u
ZSBtb3JlIGluc3RydWN0aW9uIGJlc2lkZSB0aGUga3Byb2JlCj4gaW5zdHJ1Y3Rpb24sIGZ1cnRo
ZXJtb3JlLCBSSVNDViBzdXBwb3J0cyBoeWJpcmQgUlZJIGFuZCBSVkMgaW4gc2luZ2xlCj4ga2Vy
bmVsIGJpbmFyeSwgc28gaW4gdGhlb3J5IGEgcGFpciBvZiAnQVVJUEMvSkFMUicgaXMgYWJvdXQg
dG8gY2xvYmJlcgo+IDEwIGJ5dGVzKDMgUlZDIGFuZCAxIFJWSSwgMiBieXRlcyBpcyBwYWRkaW5n
IGZvciBhbGlnbm1lbnQpIGF0IHdvcnN0Cj4gY2FzZS4gVGhlIHNlY29uZCBoYXJkc29tZSBwcm9i
bGVtIGlzIGxvb2tpbmcgZm9yIG9uZSBpbnRlZ2VyIHJlZ2lzdGVyIGFzCj4gdGhlIGRlc3RpbmF0
aW9uIG9mICdBVUlQQy9KQUxSJyB3aXRob3V0IGFueSBzaWRlLWVmZmVjdC4KClRoZXJlIGFyZSBh
IG51bWJlciBvZiBzcGVsbGluZyBlcnJvcnMsIHBsZWFzZSB1c2UgYSBzcGVsbGNoZWNrZXIgYW5k
IGlmCnlvdSByZWZlcmVuY2UgYSBmaWxlIChlLmcuIE1ha2VmaWxlKSwgbWFrZSBzdXJlIGl0IGlz
IGNvcnJlY3RseSBzcGVsbGVkCm91dC4KClRoZSBjb21tZW50cyBhYm92ZSBhcHBsaWVzIHRvIGFs
bCB0aGUgY29tbWl0IG1lc3NhZ2VzIG9mIHRoaXMgc2VyaWVzLgoKCkJqw7ZybgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
