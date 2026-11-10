Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D86C606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 07:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ar7OUaHU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=rW9x7GT1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HoSF3z85+l3i5ATWjq+tC0ixziRUiWJoyuD77FIdDhU=; b=ar7OUaHUu5Mv/Au3wd0TsDLVCB
	ci1F//30NtoJVUD/5yCQ78cVQ0JvnkU2SGdCQuWcN0uFJU8S664eTm+pQBTWBbbGhVpRg9ZJb/vxq
	fcX5RGT1/aQu0lde10yx0jf7JGvGvHCXOP9SPfbdhn+Zlg2Y1jDpoK7hteoaswPSV+WnqUFRe9z6n
	ZuXYddiNU/UFH7ClkMdMdZ2kmWe8vWo92pJHJdFWxlMU81mUp8lRODsZ+VTpSZyUlynlinpIvh+bu
	YrS7NPzndgDu0GjaTkkMDRJVtsK33Kbrxg1eUskkEE0apZkopbDeBvTMMAKvBH64cLoCfSvDESs8V
	8+BEaChA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgSY-00000002vKX-1k0D;
	Tue, 10 Nov 2026 07:40:02 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgSV-00000002vJU-3ENo
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 07:40:01 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so1091980f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 23:39:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794296397; cv=none;
        d=google.com; s=arc-20260327;
        b=KJkok2W5wETqps1vgRuTg7Rk/gZ5shaoS8mGbzC9u+HKRoNcNp6vuDJT/vsFFAU5q1
         jc4DA1GsdLSxAU0d/XoEounSwUoZrEDnYd375YEI3EKaBJDXLrO0UwATc7Qd5fA3AUX+
         nmiYSkXmvNbi1lTWxxuL5JiQkCJicouxrWwQHmL/UKT3jK35g5cpqC10OMgp3OKEwkWd
         qmUwuHTzeJQ7iujf/jsXNBwNEj4xgcAL1iUARsrjs+kjcwLfWsd9TGXkQQ7vFzhSjrll
         YyybYfCN7K6g9e7FcsX3poD52mupKYePD9EmiUQIMITAOCPuM/tMtajpaYGMKuvM/ewv
         WU9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ERnrn3wThP1DJNLbDKWT7d2OEC6GO11+OEarircH9n0=;
        fh=3JZBNltLl10EI7jA6PYFDQF/0P4F9DdVW1aea7kfl34=;
        b=SC0+H6YraRQNsPTInhjL4IlYy5ScL5VOuDAzEQu+Xr5tsftidq3LaS/F9M9oxIimWK
         jx5jbWG1HGTj8L/cw7pLfVk0SsoF3iOx37UsEDToawygpFPB3K/nRyScgfC73bx4TBZM
         720gBoY8MUoPN3++29ZHpD7JlK2s7N8C86KMcbasngaNE2flfTY329UKcwaMIOvGPA3Q
         cjsCuu7IyiGMeYlUOKYM6hl/d7TB9tenK0399i/udnjBbg+9g/+GgUJtg+ePlwKHpyXo
         TFUSbpDS9Z8eNNih6h48EEtmtdzcaQ6L7pyZBmxzO4gubQPYaKCuchiinmVc22nTJy1A
         V48g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794296397; x=1794901197; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ERnrn3wThP1DJNLbDKWT7d2OEC6GO11+OEarircH9n0=;
        b=rW9x7GT1TUjzD5SOOa0ZLhVZ/0ZXghmX4nBkCYohQL3KeRWpbf4yCrLgqRMzMiPk3S
         YJUOXekrhvGQRVPTcgNBv1wMDyJQfmNoKhmgckLq4ynPDcLwLfPpIc1xGRSAZZzxg8vy
         IJUY1xQxc6WUcI20cuKUXD14vy6x7Pu9vQHcau4lAmbw6IbGJUs/3A57IXMHNEhzJXRr
         sfz4ZNLt7BnLbO4HGFfLZD1laN2OmGeOYu7AmlIjeQkX7RAEVAPA4wkQGf2y2GB+Wn38
         okE/5usL7atsjQdUV1XHxPQi4/KkxAnZ5IVGDKb7PD0g1d1158//0JgV1mLbYpIjITri
         qsjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296397; x=1794901197;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ERnrn3wThP1DJNLbDKWT7d2OEC6GO11+OEarircH9n0=;
        b=mJj0Dfa+L3Uy+nqrLtChuYH6bM3HuiZxPrAsxW7NQNVhdMb5T+6RoMVGlqQjSXH7RD
         FjHDKnCp1khEj2CYyrLxOA00pfeC8yjsX1uMv3J/q6Ua910PAPHpxQIH7MNvrTONfjH2
         o4gCooF2AGa8FkNfBmDaN3OVYrUs7FoM3LmxH/XRi7jcHShSN0G3oVoicwVV6A6kS+7u
         +O0Y1IzCKpM0NMA1B4cUM0/ezm2WbHX3gVVDe/H2kOiBFOS1OyL9Qft/1DFxfxm3X4YA
         OiZoUDxaa2fnTEJVBhLMsyylrWdedi9kLmVlz5dYzjBLe3/i0/DMO7EtcpNNU2RadQDI
         jLVw==
X-Forwarded-Encrypted: i=1; AL+hErEPnXTXAERrJBW5xVfMiZveQ6o2r3a6UvfwL4NprNqmUFcq26y4JTlJVvVFMl+W28orLabuodjRO665JA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/acQldTfQnKwL+LZ+qDJcCtWIVhIr/KQPwoTyuttH1FgJGnWiG
	vrzPabCVj1I6UBICTB3HOIL0bEACwUX3IsuK6FT1nlY9ab3V/9auNKe82IkPWEqLP/6tBGZYB15
	+IMtzrwEuBcTVckDsHLnxfkeOAA1Rl9269Jcg5En+yQ==
X-Gm-Gg: AYBFou3olPrKRgOJ0bB0yFlNKcLuj3HxM+QouX/Ty2CYQPrBGpWTXUxXOP4hP0nlQlE
	eB81KrzVnubYPoUN5fspzosQmB9HDeKmEqpgt0QD0bfnej4ImwWQngjn/pPr5vN28by7Kh7EiU6
	/xXI4Pj7oQFFrqNQ5x1FKeDB7TIr1MHteMTzZMQvPiU2zm9EXBCNE8xF02da8t07pwWGipKWjCg
	5viCOm03JExIKTBuL6fBM5Gp16KOchRqzNQ97Yxfu/RJozBLt99spuSNk2eenfhzE+mtCqXou2B
	LiO07rOpdgM7hEhvsnBvDMrMxgl4OFo63KVeKBiiOhHEgonSzhfLfS22Gi104UqREsNBlsl1pp7
	r4aTuHAHqsEQVu/FJHmcJXb94z0wjqpJ/RTy3PxjDUIFEc+FnhyZCvAekBdvQaOdFf+1sJbNL+5
	raPf5xhL2iv18tDEP98cK1npmWCUdVrth6I8Nis15L2Cr9tUrWDL8cOpI=
X-Received: by 2002:a05:6000:3c5:b0:48e:e98:8b64 with SMTP id
 ffacd0b85a97d-4982e82c23fmr2760008f8f.19.1794296396722; Mon, 09 Nov 2026
 23:39:56 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-imsic-remote-sync-irqwork-v1-1-8b5c951fc62a@linux.dev>
 <CAAhSdy26R41W6OsTpEjMCf6iQXrtn4WrzziuGg+S9pHOHtM--A@mail.gmail.com>
 <DMM1ZNXOFC8Q.HXUWNWMD6LKE@linux.dev> <DMRCPRZVNPGZ.3HTEULWLQ76YL@linux.dev>
In-Reply-To: <DMRCPRZVNPGZ.3HTEULWLQ76YL@linux.dev>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 10 Nov 2026 13:09:44 +0530
X-Gm-Features: AclHuK-Jx-abf7O_I5yc8hPnEgpzrmNOfkNJbf5mYeWeUvlFuYAELASCvt4ok7g
Message-ID: <CAAhSdy2B=THE=m0eLG=S3XiufV=j5amnnkH1b8ydDMOmHtuZZQ@mail.gmail.com>
Subject: Re: [PATCH] irqchip/riscv-imsic: Synchronize remote state with IRQ work
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rt-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_233959_884614_00B70447 
X-CRM114-Status: GOOD (  24.79  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBOb3YgMTAsIDIwMjYgYXQgMTI6NTfigK9QTSBUcm95IE1pdGNoZWxsIDx0cm95Lm1p
dGNoZWxsQGxpbnV4LmRldj4gd3JvdGU6Cj4KPiBPbiBXZWQgTm92IDQsIDIwMjYgYXQgOTo1OSBB
TSArMDgsIFRyb3kgTWl0Y2hlbGwgd3JvdGU6Cj4gPiBPbiBUdWUgTm92IDMsIDIwMjYgYXQgMTE6
NTIgUE0gKzA4LCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gPiBPbiBUdWUsIE5vdiAzLCAyMDI2IGF0
IDE6MzQgUE0gVHJveSBNaXRjaGVsbCA8dHJveS5taXRjaGVsbEBsaW51eC5kZXY+IHdyb3RlOgo+
ID4gPiA+Cj4gPiA+ID4gUmVtb3RlIElNU0lDIHN0YXRlIHVwZGF0ZXMgYXJlIGRlZmVycmVkIHRv
IGEgdGltZXIgb24gdGhlIHRhcmdldCBDUFUuCj4gPiA+ID4gSWYgdGhhdCBDUFUgaGFzIHN0b3Bw
ZWQgaXRzIGxvY2FsIGNsb2NrZXZlbnQgYW5kIGlzIHdhaXRpbmcgZm9yIGEKPiA+ID4gPiBicm9h
ZGNhc3QgaW50ZXJydXB0LCBlbmFibGluZyB0aGUgYnJvYWRjYXN0IElSUSBjYW4gZGVwZW5kIG9u
IGRlbGl2ZXJ5Cj4gPiA+ID4gb2YgdGhhdCBzYW1lIGludGVycnVwdC4gVGhpcyBjYW4gc3RhbGwg
dGltZXIgZGVsaXZlcnkgd2hlbiB0aGUgYnJvYWRjYXN0Cj4gPiA+ID4gSVJRIGlzIHVubWFza2Vk
IG9yIG1vdmVkIHRvIGFub3RoZXIgQ1BVLCBpbmNsdWRpbmcgZHVyaW5nIENQVSBob3RwbHVnLgo+
ID4gPiA+Cj4gPiA+ID4gUXVldWUgaGFyZCBJUlEgd29yayB0byBzeW5jaHJvbml6ZSByZW1vdGUg
c3RhdGUgaW5kZXBlbmRlbnRseSBvZiB0aW1lcgo+ID4gPiA+IGRlbGl2ZXJ5LiBLZWVwIHN5bmNo
cm9ub3VzIHVwZGF0ZXMgb24gdGhlIGxvY2FsIENQVSBhbmQgdGhlIHRpbWVyIHJldHJ5Cj4gPiA+
ID4gZm9yIGFuIHVuZmluaXNoZWQgdmVjdG9yIG1vdmUuIEhhcmQgSVJRIHdvcmsgYWxzbyBhdm9p
ZHMgZGVwZW5kaW5nIG9uIGEKPiA+ID4gPiBzY2hlZHVsYWJsZSB3b3JrZXIgd2hlbiBQUkVFTVBU
X1JUIGlzIGVuYWJsZWQuCj4gPiA+Cj4gPiA+IFVzaW5nIHRpbWVyIHJldHJ5IGZvciBsb2NhbCBD
UFUgYW5kIElSUSB3b3JrIHF1ZXVlIGZvciByZW1vdGUgQ1BVcyBsb29rcwo+ID4gPiBzdHJhbmdl
LiBXaHkgbm90IHVzZSBJUlEgd29yayBxdWV1ZSBldmVuIGZvciBsb2NhbCBDUFUgPz8KPiA+IE9u
IHRoZSBsb2NhbCBDUFUgdGhlIHN5bmMgcnVucyBzeW5jaHJvbm91c2x5LCBzbyB0aGVyZSBpcyBu
b3RoaW5nIHRvCj4gPiBxdWV1ZS4gVGhlIHRpbWVyIG9ubHkgcmV0cmllcyBhbiB1bmZpbmlzaGVk
IG1vdmUsIGFuZCBieSB0aGVuIHRoZSBuZXcKPiA+IHZlY3RvciBpcyBhbHJlYWR5IGVuYWJsZWQs
IHNvIGl0IGNhbm5vdCBzdGFsbCBvbiB0aGUgYnJvYWRjYXN0IElSUS4KPiA+IFJlcXVldWVpbmcg
SVJRIHdvcmsgZnJvbSBpdHMgb3duIGhhbmRsZXIgd291bGQganVzdCBrZWVwIHNlbGYtSVBJaW5n
Cj4gPiB1bnRpbCB0aGUgb2xkIENQVSBjYXRjaGVzIHVwLgo+ID4KPiA+IEknbGwgYWRkIG1vcmUg
Y29tbWVudHMgYW5kIG1vZGlmeSB0aGUgY29tbWl0IGJvZHkuCj4gVGhhdCB3YXMgbm90IHRoZSB3
aG9sZSBzdG9yeS4gVGhlIHJldHJ5IGNhbm5vdCBzdGFsbCwgYnV0IGl0IGNhbiBiZQo+IGxhdGUu
IFRoZSBsb2NhbCBDUFUgaXMgdXN1YWxseSB0aGUgb25lIGVudGVyaW5nIGlkbGUgYW5kIHRha2lu
ZyB0aGUKPiBicm9hZGNhc3QgSVJRLCBhbmQgdGhlIHRpbWVyIGl0IGFybXMgb24gaXRzZWxmIHRo
ZXJlIGlzIG5vdCBwcm9ncmFtbWVkCj4gYmVjYXVzZSBpdHMgdGljayBpcyBhbHJlYWR5IHN0b3Bw
ZWQuIE5vdGhpbmcgdGVsbHMgaXQgd2hlbiB0aGUgb2xkIENQVQo+IGlzIGRvbmUsIHNvIHRoZSBt
b3ZlIG9ubHkgY29tcGxldGVzIG9uIGl0cyBuZXh0IGludGVycnVwdC4gT24gSzMgd2l0aAo+IGRl
ZXAgaWRsZSBJIHNlZSBtb3ZlIHdpbmRvd3Mgb2YgdXAgdG8gMC41cy4KPgo+IFNvIHlvdSBhcmUg
cmlnaHQgdGhhdCB0aGUgdGltZXIgc2hvdWxkIGdvLCBqdXN0IG5vdCBieSByZXF1ZXVlaW5nIG9u
Cj4gdGhlIGxvY2FsIENQVS4gSW4gdjIgdGhlIG9sZCBDUFUgd2lsbCBxdWV1ZSB0aGUgSVJRIHdv
cmsgb24gdGhlIG5ldyBDUFUKPiBvbmNlIGl0IGhhcyByZWxlYXNlZCB0aGUgb2xkIHZlY3Rvciwg
YW5kIHRoZSByZXRyeSB0aW1lciB3aWxsIGJlCj4gcmVtb3ZlZC4gTW92ZSB3aW5kb3dzIGRyb3Ag
dG8gYWJvdXQgMTAwdXMuIFRoaXMgd2lsbCBiZSBhIHNlcGFyYXRlCj4gcGF0Y2ggb24gdG9wIG9m
IHRoaXMgb25lLgo+CgpTb3VuZHMgZ29vZC4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
