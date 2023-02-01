Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF75C636CD
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 13:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g8/HKB8LBpLTr5lLXZl9gpkbgpHPtFK4WCVHhC7wyh0=; b=lxPZqLgwkG+zk3
	LcUPAzdHPHeoFGP/cG/oohuXa3pUTuxr7Ay6wauxJiBsyaKg/ubDOyMwBuuasSH9K4VlA4lNDJspb
	QwHvkn2UOOGtdesOSsZRpdN0co2zv1EkP8Y0farJRvylD+JXhern5DFURImHDTUG8iwxd+TTkVafh
	4mARVuGuiHSH/neiXE02j8zPnmW4iJO4dl91flcOyjccH/ywyGhUwDzhKmN3BvcU05J35UhrDF9yU
	NdvgU1n7SG9zEwoO+P5GIZA9O0qP/RvAf7W+6T/P099xDjwIk5pNCFopHtxc9IqrLdvu8jQRN+3WZ
	61JKvC7POxhufVwj/40Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNDC9-00C4Qh-2h; Wed, 01 Feb 2023 13:30:37 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNDC5-00C4Od-Jp
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 13:30:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3C334B8218A;
	Wed,  1 Feb 2023 13:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC88C433A0;
	Wed,  1 Feb 2023 13:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675258230;
	bh=d3pYOO3WhZ4razYpGLFPieZwkLG3TuflhMepgqXStp0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OrON3B4WzY+JaJAZKOsjE7fOvkaVs3DQs68nylArJjdAvMIuuv6TRaga8Zh1uC+t8
	 U6yeW1xm37y92xUf2ELhSUlAcMeN3brCSd4J5i1GNy63+0oSFUg0zqJPRAsxH3O+Vq
	 b7IDvPlkHv72vUXbua+1kek5X1yaBxTRyRHzBuIgPxLkZmV9QgcdHSommViZBq7VSd
	 R7tBhIjT9QwVO+nVAlnQzMzbL0PR+qXBeMT3REW41G7hiQp0gTUb9r23J5FbfJd++G
	 igxx683+UGcQt/R6feIXHNfpzEMXSrGRKxFF+UJXPjjtTZznrBwRd/vfrbLWHXUqWW
	 nJsddATgYntVA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Chen Guokai <chenguokai17@mails.ucas.ac.cn>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, rostedt@goodmis.org,
 mingo@redhat.com, sfr@canb.auug.org.au
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 liaochang1@huawei.com, Chen Guokai <chenguokai17@mails.ucas.ac.cn>
Subject: Re: [PATCH v6 07/13] riscv/kprobe: Prepare detour buffer for
 optimized kprobe
In-Reply-To: <20230127130541.1250865-8-chenguokai17@mails.ucas.ac.cn>
References: <20230127130541.1250865-1-chenguokai17@mails.ucas.ac.cn>
 <20230127130541.1250865-8-chenguokai17@mails.ucas.ac.cn>
Date: Wed, 01 Feb 2023 14:30:28 +0100
Message-ID: <87v8kltswb.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_053033_833550_2CD9916B 
X-CRM114-Status: GOOD (  11.28  )
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

Q2hlbiBHdW9rYWkgPGNoZW5ndW9rYWkxN0BtYWlscy51Y2FzLmFjLmNuPiB3cml0ZXM6Cgo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMvb3B0LmMgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9wcm9iZXMvb3B0LmMKPiBpbmRleCBkODRhYTE0MjBmYTIuLmE0N2Y3ZDJiZjNhNiAxMDA2
NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMvb3B0LmMKPiArKysgYi9hcmNoL3Jp
c2N2L2tlcm5lbC9wcm9iZXMvb3B0LmMKPiBAQCAtMTEsOSArMTEsMzIgQEAKPiAgI2luY2x1ZGUg
PGxpbnV4L2twcm9iZXMuaD4KPiAgI2luY2x1ZGUgPGFzbS9rcHJvYmVzLmg+Cj4gICNpbmNsdWRl
IDxhc20vcGF0Y2guaD4KPiArI2luY2x1ZGUgPGFzbS9hc20tb2Zmc2V0cy5oPgo+ICAKPiAgI2lu
Y2x1ZGUgInNpbXVsYXRlLWluc24uaCIKPiAgI2luY2x1ZGUgImRlY29kZS1pbnNuLmgiCj4gKyNp
bmNsdWRlICIuLi8uLi9uZXQvYnBmX2ppdC5oIgo+ICsKPiArc3RhdGljIHZvaWQgb3B0aW1pemVk
X2NhbGxiYWNrKHN0cnVjdCBvcHRpbWl6ZWRfa3Byb2JlICpvcCwKPiArCQkJICAgICAgIHN0cnVj
dCBwdF9yZWdzICpyZWdzKQo+ICt7Cj4gKwlpZiAoa3Byb2JlX2Rpc2FibGVkKCZvcC0+a3ApKQo+
ICsJCXJldHVybjsKPiArCj4gKwlwcmVlbXB0X2Rpc2FibGUoKTsKPiArCWlmIChrcHJvYmVfcnVu
bmluZygpKSB7Cj4gKwkJa3Byb2Jlc19pbmNfbm1pc3NlZF9jb3VudCgmb3AtPmtwKTsKPiArCX0g
ZWxzZSB7Cj4gKwkJX190aGlzX2NwdV93cml0ZShjdXJyZW50X2twcm9iZSwgJm9wLT5rcCk7Cj4g
KwkJLyogU2F2ZSBza2lwcGVkIHJlZ2lzdGVycyAqLwo+ICsJCWluc3RydWN0aW9uX3BvaW50ZXJf
c2V0KHJlZ3MsICh1bnNpZ25lZCBsb25nKW9wLT5rcC5hZGRyKTsKPiArCQlnZXRfa3Byb2JlX2N0
bGJsaygpLT5rcHJvYmVfc3RhdHVzID0gS1BST0JFX0hJVF9BQ1RJVkU7Cj4gKwkJb3B0X3ByZV9o
YW5kbGVyKCZvcC0+a3AsIHJlZ3MpOwo+ICsJCV9fdGhpc19jcHVfd3JpdGUoY3VycmVudF9rcHJv
YmUsIE5VTEwpOwo+ICsJfQo+ICsJcHJlZW1wdF9lbmFibGUoKTsKPiArfQo+ICtOT0tQUk9CRV9T
WU1CT0wob3B0aW1pemVkX2NhbGxiYWNrKQo+ICAKPiAgc3RhdGljIGludCBpbl9hdWlwY19qYWxy
X3JhbmdlKGxvbmcgdmFsKQo+ICB7Cj4gQEAgLTMwLDYgKzUzLDExIEBAIHN0YXRpYyBpbnQgaW5f
YXVpcGNfamFscl9yYW5nZShsb25nIHZhbCkKPiAgI2VuZGlmCj4gIH0KPiAgCj4gKyNkZWZpbmUg
REVUT1VSX0FERFIoY29kZSwgb2ZmcykgXAo+ICsJKCh2b2lkICopKCh1bnNpZ25lZCBsb25nKShj
b2RlKSArIChvZmZzKSkpCj4gKyNkZWZpbmUgREVUT1VSX0lOU04oY29kZSwgb2ZmcykgXAo+ICsJ
KCooa3Byb2JlX29wY29kZV90ICopKCh1bnNpZ25lZCBsb25nKShjb2RlKSArIChvZmZzKSkpCgpD
YW4gdGhpcyBjYXVzZSBhIG1pc2FsaWduZWQgdTMyIGxvYWQgZXhjZXB0aW9uPwoKCkJqw7ZybgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
