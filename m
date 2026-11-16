Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DB9606A329
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 07:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=soxPmoRq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=IgmDLLBf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1Fnx8Hs2fJFINh2tcMSzAwgYvW19RJU0j1nuZlwWt4s=; b=soxPmoRqRbgY2V8HorUhINBLw0
	av3rGJVRyvBreEQMJG+ZUrrJZMQ7IdVb8fL8Y0GTGrYbdlbte5uWUjP9C7MH6he8bDSTSS6Hg3gs5
	3yYJk7Txb9+qXilWvbzntudj2/6J0rhdi6mA1xwj5hb+ZTulhY08BdCNShijTCXRaDiBTSlAZOt9D
	l/lw48EBpvt7P7/trs89sUa5NJiiPCY2oxxZw9AFSmYmr73rGtOO5e8zxEf1kmMRK/lzJJsKMnYG/
	goSTD7QMWJDyCZOTgV6RAaYSEtLwDu683gvdSWkrkzqKV8PMEdCE3ToPCczMmj6KVtE1rs/Lj0cgC
	20uone6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrbn-00000001Unu-0IKm;
	Mon, 16 Nov 2026 07:58:35 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrbj-00000001Uli-1W8Y
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 07:58:33 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4922dbcee23so1409383f8f.0
        for <linux-riscv@lists.infradead.org>; Sun, 15 Nov 2026 23:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794815909; x=1795420709; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MJ7d3rNHeUtNAkSjUSjsQ3HRQiSBTnNiLXOBSu1liKw=;
        b=IgmDLLBfrFdsaPqlNCX700adF3vdT83kDFQXlYadlcFAcD0K8waDricPSM1R4eSnPC
         CxHx0IRQhscMGUrs/KpqDz76cFig4JXRRWfYYotqbrdlPabYszlEfv+3RE7YRSbPT0CN
         t9wN+7zZpImEcP1WyPmaxxH29ZugGGHXTqQmgalR0vZHSfgxD01NrqcL/47Y2QLx25YM
         LNs7+9Wb7OeB7JFJPrgYaotNq+2lVC2XJtpazyqoW13fvwlGoswKE+pJSu8TiBhAnQmP
         WrW5tZ7gh3dPobwq6zXvzTUSXMJ1IYabLMWu7dpx5hxehBLFhT61bJVZBqahhcm+342n
         WP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815909; x=1795420709;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MJ7d3rNHeUtNAkSjUSjsQ3HRQiSBTnNiLXOBSu1liKw=;
        b=mJAfdT8XfuYho/1VjqnIbtg2FWT4LR4NdrIjgJala6VrAK5KJXm0PyHHjV4B8+bAtu
         UYo76iXtXAe3+2ZaJOem3woUg2M5Bxe7SBaPTrSZYt16ksfvxBbq9kej8gn7EJo+Rc9/
         Lj0E69P8fO28vkx3hkNiiDbtkfUedMXvmY/upJiFJtAxrjuZ0TnxjftCbetMHGSUbgb1
         4u3BkqC3nPYtiTotWTjqLDWWPGoH2ieDcVUKSQO+C9DsLtpty02eLhOXCNgyTXpv7c8m
         /8Gdn/QDNL3tnPiWBo7fM5rpSc1FmodVMwwW2spIhMpAxApytmAlk6Tizkq/YyzGAVAU
         pCiQ==
X-Forwarded-Encrypted: i=1; AL+hErGq31F9UvxaDwu9ykdTpxD1+KyasaTwpjziiq+XZ08JL/67MfUbSQ+0mGvx16F424e5dSCBg0rE1udFoA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9nTmO4qVuZMqw1FUecSukNFAAXvIxSTEI0nvnCI9R2F245+E+d
	J94Lw41NYi5mxCVEeJEcBx2XJyFaQhyd79Emw4xyZsnvJZp1xoHXnlicTB2mcYDj1Z3d
X-Gm-Gg: AYBFou11KfvjrJZk9AKBs49w5d4+G5Hm9k5LOMHxMCaA70hJlSNSc3lPFuXjSaoJMdf
	/Uc1T9+2GVIzd5z1FspuIJTF/GdTPZzAoVFyLDxClVcf5SWYfa8XwEGvrxHXEecpyijrHpfPbnl
	gWCjf0i8ptau9lhMWKU9jMY6SAvvdNVTtQtG8yY+VleJ9GdWddhxOKTtgGHtrLZ/t443zmca1Du
	SAZtJmXgyfQd/Gt74i8U4IMbS0V3IGO5uMcY78PVWvVDUxq4QecSG3hNqwFtjttc9SEirg3gB1W
	/oBny/odShylN3wqHGkmAkrQf7mIQxxH64VomhHzWrf4LrQ9xNGPB8uFdUPvJiuSYtPCe18kBTB
	EXyTSfbHXEg3vBeOmi1leYzoSyVI4pHiZkSWqpVKeJJ4bp+MRVQYmTey9n7kqVbN9AHP3z/YtKa
	wpqjTn3sr4LRoUCIUAH4aT2UU6ZGWpBa7jAkv7fPXdGym1emPq3GUxlYrXCz4NMLx7XwCVK4PBF
	aqqCzghByR1zvpd3pm2JmX5dEei+ge8F7Tw5OpV38AOUxZhEIpypxygt9DpSiYCY5NAs6OmRGaw
	IOCsK3RCSvhzbq/xWqX4GBkNLSLVKprIhnjO9i+mDLT7DJbcLcIHNDTny29GPIY=
X-Received: by 2002:a05:6000:3108:b0:48d:f9dd:e3de with SMTP id ffacd0b85a97d-49c7353c415mr20084703f8f.45.1794815908942;
        Sun, 15 Nov 2026 23:58:28 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5ff2be55sm21124748f8f.28.2026.11.15.23.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:58:28 -0800 (PST)
Message-ID: <19b4c35c016a91302bf6bc3380bfcd3d21dc50c0.camel@amutable.com>
Subject: Re: [PATCH RFC 1/4] powerpc/crash_dump: check ioremap_cache() in
 copy_oldmem_page()
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Breno Leitao
	 <leitao@debian.org>, Chris Mason <mason@kernel.org>, Thomas Gleixner
	 <tglx@kernel.org>, x86@kernel.org, kexec@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-kernel@vger.kernel.org, David Hildenbrand <david@kernel.org>, 
	stable@vger.kernel.org
Date: Mon, 16 Nov 2026 08:58:26 +0100
In-Reply-To: <20261112-work-procfs-oldmem-v1-1-ecdcafd99265@kernel.org>
References: <20261112-work-procfs-oldmem-v1-0-ecdcafd99265@kernel.org>
	 <20261112-work-procfs-oldmem-v1-1-ecdcafd99265@kernel.org>
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_235831_981137_A7825807 
X-CRM114-Status: GOOD (  14.63  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCAyMDI2LTExLTEyIGF0IDE3OjM3ICswMTAwLCBDaHJpc3RpYW4gQnJhdW5lciB3cm90
ZToKPiBjb3B5X29sZG1lbV9wYWdlKCkgbWFwcyBhIHBhZ2Ugb2YgdGhlIG9sZCBrZXJuZWwgdGhh
dCBpc24ndCBpbiB0aGUKPiBsaW5lYXIgbWFwcGluZyB3aXRoIGlvcmVtYXBfY2FjaGUoKSBhbmQg
Y29waWVzIGZyb20gaXQgd2l0aG91dAo+IGNoZWNraW5nCj4gd2hldGhlciB0aGUgbWFwcGluZyB3
b3JrZWQuIElmIGl0IGRpZG4ndCwgdGhlIGNvcHkgcmVhZHMgZnJvbSBhbgo+IG9mZnNldAo+IGlu
dG8gdGhlIE5VTEwgcGFnZS4gVGhhdCBvb3BzZXMgdW5sZXNzIHRoZSBjb3B5IGhhcHBlbnMgdG8g
YmUgYSB1c2VyCj4gY29weSwgd2hvc2UgZXhjZXB0aW9uIHRhYmxlIGVudHJpZXMgdHVybiB0aGUg
ZmF1bHQgaW50byBhIHNob3J0IGNvcHkuCj4gCj4gUmV0dXJuIC1FTk9NRU0gbGlrZSB0aGUgb3Ro
ZXIgYXJjaGl0ZWN0dXJlcyBkby4gcmVhZF9mcm9tX29sZG1lbSgpCj4gdHVybnMgdGhhdCBpbnRv
IC1FRkFVTFQgbGlrZSBhbnkgb3RoZXIgc2hvcnQgY29weS4KPiAKPiBSZXBvcnRlZC1ieTogQ2hy
aXMgTWFzb24gPG1hc29uQGtlcm5lbC5vcmc+Cj4gRml4ZXM6IDU0YzMyMDIxZWI2ZiAoIltQQVRD
SF0gcG93ZXJwYzogQWRkIGFyY2gtZGVwZW5kZW50Cj4gY29weV9vbGRtZW1fcGFnZSIpCj4gQ2M6
IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBSZXZpZXdlZC1ieTogQnJlbm8gTGVpdGFvIDxsZWl0
YW9AZGViaWFuLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gQnJhdW5lciAoQW11dGFi
bGUpIDxicmF1bmVyQGtlcm5lbC5vcmc+CgpSZXZpZXdlZC1ieTogQWxleGFuZGVyIE1pa2hhbGl0
c3luIDxhbGV4QGFtdXRhYmxlLmNvbT4KCj4gLS0tCj4gwqBhcmNoL3Bvd2VycGMva2VybmVsL2Ny
YXNoX2R1bXAuYyB8IDIgKysKPiDCoDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAK
PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9jcmFzaF9kdW1wLmMKPiBiL2FyY2gv
cG93ZXJwYy9rZXJuZWwvY3Jhc2hfZHVtcC5jCj4gaW5kZXggMTAzYjY2MDVkZDY4Zi4uMTU0Mzkx
N2JkM2UxZCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL2NyYXNoX2R1bXAuYwo+
ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvY3Jhc2hfZHVtcC5jCj4gQEAgLTg2LDYgKzg2LDgg
QEAgc3NpemVfdCBjb3B5X29sZG1lbV9wYWdlKHN0cnVjdCBpb3ZfaXRlciAqaXRlciwKPiB1bnNp
Z25lZCBsb25nIHBmbiwKPiDCoAkJY3NpemUgPSBjb3B5X3RvX2l0ZXIodmFkZHIgKyBvZmZzZXQs
IGNzaXplLCBpdGVyKTsKPiDCoAl9IGVsc2Ugewo+IMKgCQl2YWRkciA9IGlvcmVtYXBfY2FjaGUo
cGFkZHIsIFBBR0VfU0laRSk7Cj4gKwkJaWYgKCF2YWRkcikKPiArCQkJcmV0dXJuIC1FTk9NRU07
Cj4gwqAJCWNzaXplID0gY29weV90b19pdGVyKHZhZGRyICsgb2Zmc2V0LCBjc2l6ZSwgaXRlcik7
Cj4gwqAJCWlvdW5tYXAodmFkZHIpOwo+IMKgCX0KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
