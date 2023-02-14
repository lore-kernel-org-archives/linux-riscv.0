Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F4DC61DA4
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 06:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mpPYnBQU4zJJH+suwiZ3+pxCh15lJW3cs1NbCffNAN8=; b=B+s2eFKbmncxJf
	BelrQTVNpJuyv7TcxNC601q8ZA0nQ/Svj96Yd/KSJSCjkmimvxBZyGMsXCZMHbdOIlHDECTOwVbuM
	gYapoosnw66yzOnlaAO/Y7ZaP0FV3j91M1QYlW0UoUDN8VJg3GGpD1nIP/e2ZAmeHBEMttQeTy60q
	CLK1wSOphL6ZDmxRd099NMAC5/vGJHolJtzZISV7Mqh+RQZoXRundGeIrV8jb7FkC8uMHAAkHN9Rq
	sovyTfjWW60aVpSHz0+PjXfdm090idjoNgP+51Q1ngKj2AvY9BOpK4aZmhCek75kdIl4CIgXEDz1Q
	5mzN4aBTqbRgAe3fkNZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRp2H-0004ln-E0; Tue, 14 Feb 2023 06:43:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRp2D-0004km-T9; Tue, 14 Feb 2023 06:43:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 799F760E8C;
	Tue, 14 Feb 2023 06:43:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C861C433EF;
	Tue, 14 Feb 2023 06:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676357003;
	bh=lq4W396FO+Q3Y2AX/3T1BrpLEZNbnz8ryv/Vmo361xs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VFCrbqIcsVnE5fUmOjjPNWrBldBZeePy7P0Yz2LYjVZLjKBVTrDsCZh1/XFBLHg4p
	 1Ql4Wq/1+ylkQvHEV8goFJdarOX0C5r35G6keDIyrMlrMAc/L1IAs67fxxL9f48tMn
	 FhkWOJa5RTDP9ctWVydEKvnWaGujrrLUGyO0NlpMd0Iig5Wlvt1TftfCkO9l/vPfvP
	 AWyBvPlM1EbpIj2xVDK4hRIyp1FP7ZSp/fOQY7Y4mXWcAvqQUqRFoEcFT7O15RfuGW
	 J4sKbRe1zbx+jgHj4n7HKpJ+Ibsb7lZL3CbPWBEbRLpg0h01IwKSg7aX8qY7ZqvdVi
	 PxKV6c9orGOYQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Vineet Gupta <vineetg@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>,
 linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org,
 atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: greentime.hu@sifive.com, guoren@linux.alibaba.com, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko
 Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones
 <ajones@ventanamicro.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Conor Dooley
 <conor.dooley@microchip.com>, Jisheng Zhang <jszhang@kernel.org>, Vincent
 Chen <vincent.chen@sifive.com>, Guo Ren <guoren@kernel.org>, Li Zhengyu
 <lizhengyu3@huawei.com>, Masahiro Yamada <masahiroy@kernel.org>, Richard
 Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH -next v13 10/19] riscv: Allocate user's vector context
 in the first-use trap
In-Reply-To: <82551518-7b7e-8ac9-7325-5d99d3be0406@rivosinc.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-11-andy.chiu@sifive.com>
 <875ycdy22c.fsf@all.your.base.are.belong.to.us>
 <82551518-7b7e-8ac9-7325-5d99d3be0406@rivosinc.com>
Date: Tue, 14 Feb 2023 07:43:21 +0100
Message-ID: <87sff8ags6.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_224326_036823_8C6450D4 
X-CRM114-Status: GOOD (  16.67  )
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

VmluZWV0IEd1cHRhIDx2aW5lZXRnQHJpdm9zaW5jLmNvbT4gd3JpdGVzOgoKPiBPbiAyLzcvMjMg
MDY6MzYsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4+PiArYm9vbCBydnZfZmlyc3RfdXNlX2hhbmRs
ZXIoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4+PiArewo+Pj4gKwlfX3VzZXIgdTMyICplcGMgPSAo
dTMyICopcmVncy0+ZXBjOwo+Pj4gKwl1MzIgdHZhbCA9ICh1MzIpcmVncy0+YmFkYWRkcjsKPj4+
ICsKPj4+ICsJLyogSWYgViBoYXMgYmVlbiBlbmFibGVkIHRoZW4gaXQgaXMgbm90IHRoZSBmaXJz
dC11c2UgdHJhcCAqLwo+Pj4gKwlpZiAodnN0YXRlX3F1ZXJ5KHJlZ3MpKQo+Pj4gKwkJcmV0dXJu
IGZhbHNlOwo+Pj4gKwkvKiBHZXQgdGhlIGluc3RydWN0aW9uICovCj4+PiArCWlmICghdHZhbCkg
ewo+Pj4gKwkJaWYgKF9fZ2V0X3VzZXIodHZhbCwgZXBjKSkKPj4+ICsJCQlyZXR1cm4gZmFsc2U7
Cj4+PiArCX0KPj4+ICsJLyogRmlsdGVyIG91dCBub24tViBpbnN0cnVjdGlvbnMgKi8KPj4+ICsJ
aWYgKCFpbnNuX2lzX3ZlY3Rvcih0dmFsKSkKPj4+ICsJCXJldHVybiBmYWxzZTsKPj4+ICsJLyog
U2FuaXR5IGNoZWNrLiBkYXRhcCBzaG91bGQgYmUgbnVsbCBieSB0aGUgdGltZSBvZiB0aGUgZmly
c3QtdXNlIHRyYXAgKi8KPj4+ICsJV0FSTl9PTihjdXJyZW50LT50aHJlYWQudnN0YXRlLmRhdGFw
KTsKPj4+ICsJLyoKPj4+ICsJICogTm93IHdlIHN1cmUgdGhhdCB0aGlzIGlzIGEgViBpbnN0cnVj
dGlvbi4gQW5kIGl0IGV4ZWN1dGVzIGluIHRoZQo+Pj4gKwkgKiBjb250ZXh0IHdoZXJlIFZTIGhh
cyBiZWVuIG9mZi4gU28sIHRyeSB0byBhbGxvY2F0ZSB0aGUgdXNlcidzIFYKPj4+ICsJICogY29u
dGV4dCBhbmQgcmVzdW1lIGV4ZWN1dGlvbi4KPj4+ICsJICovCj4+PiArCWlmIChydnZfdGhyZWFk
X3phbGxvYygpKSB7Cj4+PiArCQlmb3JjZV9zaWcoU0lHS0lMTCk7Cj4+PiArCQlyZXR1cm4gdHJ1
ZTsKPj4+ICsJfQo+PiBTaG91bGQgdGhlIGFsdHN0YWNrIHNpemUgYmUgdGFrZW4gaW50byBjb25z
aWRlcmF0aW9uLCBsaWtlIHg4NiBkb2VzIGluCj4+IHZhbGlkYXRlX3NpZ2FsdHN0YWNrKCkgKHNl
ZSBfX3hzdGF0ZV9yZXF1ZXN0X3Blcm0oKSkuCj4KPiBGb3IgYSBwcmVleGlzdGluZyBhbHRlcm5h
dGUgc3RhY2sgPwoKWWVzLgoKPiBPdGhlcndpc2UgdGhlcmUgaXMgbm8gCj4gImNvbmZpZ3VyYXRp
b24iIGxpa2UgeDg2IHRvIGNyb3NzLWNoZWNrIGFnYWluc3QgYW5kIFYgZmF1bHQgaW1wbGllcyAK
PiBsYXJnZSdpc2ggc2lnbmFsIHN0YWNrLgo+IFNlZSBiZWxvdyBhcyB3ZWxsLgo+Cj4+IFJlbGF0
ZWQ7IFdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gaW1wbGVtZW50IHNpZ2FsdHN0YWNrX3NpemVfdmFs
aWQoKSBmb3IKPj4gcmlzY3YsIGFuYWxvZ291cyB0byB4ODY/Cj4KPiBJbmRlZWQgd2UgbmVlZCB0
byBkbyB0aGF0IGZvciB0aGUgY2FzZSB3aGVyZSBhbHQgc3RhY2sgaXMgYmVpbmcgc2V0dXAsIAo+
ICphZnRlciogViBmYXVsdC1vbi1maXJzdCB1c2UuCj4gQnV0IGhvdyB0byBoYW5kbGUgYW4gZXhp
c3RpbmcgYWx0IHN0YWNrIHdoaWNoIG1pZ2h0IG5vdCBiZSBiaWcgZW5vdWdoIHRvIAo+IGhhbmRs
ZSBWIHN0YXRlID8KCldoYXQgSSdtIGdldHRpbmcgYXQgaXMgYSBzdHJpY3RlciBjaGVjayBhdCB0
aGUgdGltZSBvZiBmYXVsdAooU0lHSUxML2VuYWJsZSBWKSBoYW5kbGluZy4gSWYgdGhlICpleGlz
dGluZyogYWx0c3RhY2sgaXMgbm90IGJpZwplbm91Z2gsIGtpbGwgdGhlIHByb2Nlc3MgLS0gc2lt
aWxhciB0byB0aGUgcnZ2X3RocmVhZF96YWxsb2MoKSBoYW5kbGluZwphYm92ZS4KClNvLCB0d28g
Y2hhbmdlczoKCjEuIERpc2FsbG93IFYtZW5hYmxlbWVudCBpZiB0aGUgZXhpc3RpbmcgYWx0c3Rh
Y2sgZG9lcyBub3QgZml0IGEgVi1zaXplZAogICBmcmFtZS4KMi4gU2FuaXRpemUgYWx0c3RhY2sg
Y2hhbmdlcyB3aGVuIFYgaXMgZW5hYmxlZC4KCk90aGVyIHRoYW4gdGhlIGFsdHN0YWNrIGhhbmRs
aW5nLCBJIHRoaW5rIHRoZSBzZXJpZXMgaXMgYSBnb29kIHN0YXRlISBJdAp3b3VsZCBncmVhdCBp
ZiB3ZSBjb3VsZCBzZWUgYSB2MTQgbGFuZCBpbiAtbmV4dC4uLgoKCkJqw7ZybgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
