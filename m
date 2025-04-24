Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC6BC369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 18:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ut6Muplu8L9dEOo/6MeOhKG5Axon+NPIzLgqV7gdl88=; b=qYdqTvovaDh2EF1iNQ+XJv6xq6
	mzc4XTgGuHKMJw0i/9/eglWzIQqgm7bZCXdYkTvNVEYcPnTzcnLh7Eg7dqyx9k63SDazrdC65rwDc
	9XbQf9kgHZ6YthKlfgLXG9ZasM/qZ7gW8CaZJ0KLlHCyHdTB/JsI4oj1UtFSD+hcjCO92UilJeH+O
	SKLCJZ990KQ08DIW4qrPjNsVvdVaV7sBxhKqCmbPymMUfKqQ4Hi3R0mX9TntZBZZPRxWtlc15eHe4
	d+uamjepT6Lo6CuFylpgZwjlTwEsuHramnzqU19zQu9fzxkO0T+tUq+HAioXGAR1pzF6KhCthiSuL
	pO4PhHjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80vi-0000000Ey63-1FNa;
	Thu, 24 Apr 2025 18:04:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80vg-0000000Ey5n-3YDJ
	for linux-riscv@bombadil.infradead.org;
	Thu, 24 Apr 2025 18:04:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=R+2ifGTP7Zuk1f3PGxpKoh8D1eRLE/ZHAefBGZIpiLo=; b=J+N2VVe4dZlADXSOrJZbmGxzV8
	v67bF2Wx6M608W5Ebc865YGHBWw6H2ZwcdeFvzqfizQW5NUWwLb1SarbH6pWQpT8Om5pmjkxcZD0j
	zRHyRJu3brI2Yyb9nT5FM5m1NpanBVKPtX0QLvF7Ih09si7dZOi6a8gPL60i/4iXe6AIb2z6xhV4V
	7+kHR7w82yVYCT2i6G+uPUEtI47fKL1ardGjWgl10zOSX6PZ7vT63pZ41HfAb4sc1R3k6x7Cty0xy
	kScSvpBqbu1xKS9BPMxlborGW8m516HOrU1ACmbmtuc68p3Mn1d0JioadCUXt5JW8Sy+AY8w2kgq/
	OesN6AMQ==;
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u80vd-0000000BtX3-3G0i
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 18:04:07 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-223fd89d036so17814035ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 11:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745517843; x=1746122643; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R+2ifGTP7Zuk1f3PGxpKoh8D1eRLE/ZHAefBGZIpiLo=;
        b=qFAtu/Q9ZcL7w8lLWCe8BVUYfZb84k/XXVAQziTasLMfY1kvNm8qPcgx84v/gquYbX
         p0A4Rak1n5qNFN7QniF+2mBWjB5UC1zWXFBz6LWIdIQ7rjPLypA3tCYhY8uhRG8GtuvJ
         xPZHwNsRB4Za1wh5lRLft8YQRkT2b2NKplWL4G6W8kdX3oLi4a3zDdgQg/R0LPYuwiq0
         zgTSOsFAnJC7eLYYGCIIl7FLSxI4rpv6e+xBwMSAQ7c4TzG8MYHo4a7v2YN9oKhmB0Zp
         fZmuIBhEuUjuedJ8MVU3GQ0zRQwhnxRT82+Jw9WMLtdSRT2wjMGRzsSuh32xvfD+yMzu
         HQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745517843; x=1746122643;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R+2ifGTP7Zuk1f3PGxpKoh8D1eRLE/ZHAefBGZIpiLo=;
        b=fhIGGmIziMrF23TxfdwZIPtQpya107QHxPy+uE4PnZjeqZuIZze2+66RLK0iu7b9Xo
         LyWPjokabJOc/Te0kutxuzvwZ0RixuCOO1XvTc9H1AeFlTa4X+FDx9hElW+vDlvUCK79
         TXQdRtIK43W1N6Z/U5c2GoogFTB7fTww1Lq3v6AoeIWZ6o8pCPXCSqhpoFs1oP9l08R8
         VZ9mZ95mW9x0jSEOn73ToR+kHfTjNSoqykrTeB4punZvVTJNvLAvE64eJ3gu4ImfDBki
         halB0Q8Rh3HqXwCrT2hu5k6YydoTS2qzRDxRrDZvloXTENQFMSuaUmPnHMakQSQiicdX
         CBjA==
X-Forwarded-Encrypted: i=1; AJvYcCXTK59Er77mAA9QZdxJyHpzbAYdSkJVW2ZVqobMEi+U4T6zKYSaqGoEtWbXlnx5pdKiZfCWtne0xatdNA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2efJQ7L+1nM5yziSx30iZdFKBUG/LTbyBB+yBnV/T6P1CyEPF
	rndEDKDsoe8iqcXOHRagSrfBK7Pl6DnDufm+yhXZzGiFoNFQ4j0Sxi8PWwXbr0E=
X-Gm-Gg: ASbGnctgO9OL8f9C5Br42qFPdJtzornfQCRjvB49go4fVUjP0BBGjhwa/RuzKodfzuE
	HsN20LyY8qn0zqSagmGIguAoLj+fJAuJpStrdBe+k0jAIAhyBT/FU7vt1ImyAjr2ZJwk16ahjIQ
	Z+vKoucq/rtppgoIHs67PwP0DYHUuAnAGATJK4qOh4Tr6XFvo2ZaAZ+h7C7ZO6o62QCoiF3TLZE
	vXvPNywPiA7E9+DO4N7ckY5PVy/vYgulTXWvD1TxCznRUjf1V26MAZ3bXeAMROxe/D3p0SPIpT2
	XBO47k1TFzcwxfUqkfb46kP5lFaFiks6biLcP3QM8Bn9uyiNjfz7OHiRD4Tw2w==
X-Google-Smtp-Source: AGHT+IEwApZFffChVQ3IgP8GwvBv+BNm7qJFv/s7tyP4mivow/7aAesEdu2H5hIh83xgouvcI3whKA==
X-Received: by 2002:a17:902:cec8:b0:21f:4c8b:c514 with SMTP id d9443c01a7336-22dbd46edccmr5459035ad.45.1745517843026;
        Thu, 24 Apr 2025 11:04:03 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f7ec0bb2sm1513897a12.18.2025.04.24.11.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 11:04:02 -0700 (PDT)
Date: Thu, 24 Apr 2025 11:03:59 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com, Zong Li <zong.li@sifive.com>,
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v12 05/28] riscv: usercfi state for task and save/restore
 of CSR_SSP on trap entry/exit
Message-ID: <aAp9D7txw8y9WL5m@debug.ba.rivosinc.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-5-e51202b53138@rivosinc.com>
 <D92WQWAUQYY4.2ED8JAFBDHGRN@ventanamicro.com>
 <aAmEnK0vSgZZOORL@debug.ba.rivosinc.com>
 <D9EV1K8ZQQJR.20CRTYLQBN9UE@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D9EV1K8ZQQJR.20CRTYLQBN9UE@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_190405_979661_F1276A66 
X-CRM114-Status: GOOD (  21.98  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBBcHIgMjQsIDIwMjUgYXQgMDI6MTY6MzJQTSArMDIwMCwgUmFkaW0gS3LEjW3DocWZ
IHdyb3RlOgo+MjAyNS0wNC0yM1QxNzoyMzo1Ni0wNzowMCwgRGVlcGFrIEd1cHRhIDxkZWJ1Z0By
aXZvc2luYy5jb20+Ogo+PiBPbiBUaHUsIEFwciAxMCwgMjAyNSBhdCAwMTowNDozOVBNICswMjAw
LCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4+PjIwMjUtMDMtMTRUMTQ6Mzk6MjQtMDc6MDAsIERl
ZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPjoKPj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rZXJuZWwvZW50cnkuUyBiL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMKPj4+PiBAQCAt
MTQ3LDYgKzE0NywyMCBAQCBTWU1fQ09ERV9TVEFSVChoYW5kbGVfZXhjZXB0aW9uKQo+Pj4+Cj4+
Pj4gIAlSRUdfTCBzMCwgVEFTS19USV9VU0VSX1NQKHRwKQo+Pj4+ICAJY3NycmMgczEsIENTUl9T
VEFUVVMsIHQwCj4+Pj4gKwkvKgo+Pj4+ICsJICogSWYgcHJldmlvdXMgbW9kZSB3YXMgVSwgY2Fw
dHVyZSBzaGFkb3cgc3RhY2sgcG9pbnRlciBhbmQgc2F2ZSBpdCBhd2F5Cj4+Pj4gKwkgKiBaZXJv
IENTUl9TU1AgYXQgdGhlIHNhbWUgdGltZSBmb3Igc2FuaXRpemF0aW9uLgo+Pj4+ICsJICovCj4+
Pj4gKwlBTFRFUk5BVElWRSgibm9wOyBub3A7IG5vcDsgbm9wIiwKPj4+PiArCQkJCV9fc3RyaW5n
aWZ5KAkJCVwKPj4+PiArCQkJCWFuZGkgczIsIHMxLCBTUl9TUFA7CVwKPj4+PiArCQkJCWJuZXog
czIsIHNraXBfc3NwX3NhdmU7CVwKPj4+PiArCQkJCWNzcnJ3IHMyLCBDU1JfU1NQLCB4MDsJXAo+
Pj4+ICsJCQkJUkVHX1MgczIsIFRBU0tfVElfVVNFUl9TU1AodHApOyBcCj4+Pj4gKwkJCQlza2lw
X3NzcF9zYXZlOiksCj4+Pj4gKwkJCQkwLAo+Pj4+ICsJCQkJUklTQ1ZfSVNBX0VYVF9aSUNGSVNT
LAo+Pj4+ICsJCQkJQ09ORklHX1JJU0NWX1VTRVJfQ0ZJKQo+Pj4KPj4+KEknZCBwcmVmZXIgdGhp
cyBjbG9zZXIgdG8gdGhlIHVzZXJfc3AgYW5kIGtlcm5lbF9zcCBzd2FwLCBpdCdzIGJyZWFraW5n
Cj4+PiB0aGUgZmxvdyBoZXJlLiAgV2UgYWxzbyBhbHJlYWR5IGtub3cgaWYgd2UndmUgcmV0dXJu
ZWQgZnJvbSB1c2Vyc3BhY2UKPj4+IG9yIG5vdCBldmVuIHdpdGhvdXQgU1JfU1BQLCBidXQgcmV1
c2luZyB0aGUgaW5mb3JtYXRpb24gbWlnaHQgdGFuZ2xlCj4+PiB0aGUgbG9naWMuKQo+Pgo+PiBJ
ZiBDU1JfU0NSQVRDSCB3YXMgMCwgdGhlbiB3ZSB3b3VsZCBiZSBjb21pbmcgZnJvbSBrZXJuZWwg
ZWxzZSBmbG93IGdvZXMKPj4gdG8gYC5Mc2F2ZV9jb250ZXh0YC4gSWYgd2Ugd2VyZSBjb21pbmcg
ZnJvbSBrZXJuZWwgbW9kZSwgdGhlbiBldmVudHVhbGx5Cj4+IGZsb3cgbWVyZ2VzIHRvIGAuTHNh
dmVfY29udGV4dGAuCj4+Cj4+IFNvIHdlIHdpbGwgYmUgc2F2aW5nIENTUl9TU1Agb24gYWxsIGtl
cm5lbCAtLSA+IGtlcm5lbCB0cmFwIGhhbmRsaW5nLiBUaGF0Cj4+IHdvdWxkIGJlIHVubmVjZXNz
YXJ5LiBJSVJDLCB0aGlzIHdhcyBvbmUgb2YgdGhlIGZpcnN0IHJldmlldyBjb21tZW50cyBpbgo+
PiBlYXJseSBSRkMgc2VyaWVzIG9mIHRoZXNlIHBhdGNoIHNlcmllcyAodG8gbm90IHRvdWNoIENT
Ul9TU1AgdW4tbmVjZXNzYXJpbHkpCj4+Cj4+IFdlIGNhbiBhdm9pZCB0aGF0IGJ5IGVuc3VyaW5n
IHdoZW4gd2UgYnJhbmNoIGJ5IGRldGVybWluaW5nIGlmIHdlIGFyZSBjb21pbmcKPj4gZnJvbSB1
c2VyIHRvIHNvbWV0aGluZyBsaWtlIGAuTHNhdmVfc3NwYCB3aGljaCBldmVudHVhbGx5IG1lcmdl
cyBpbnRvCj4+ICIuTHNhdmVfY29udGV4dCIuIEFuZCBpZiB3ZSB3ZXJlIGNvbWluZyBmcm9tIGtl
cm5lbCB0aGVuIHdlIHdvdWxkIGJyYW5jaCB0bwo+PiBgLkxzYXZlX2NvbnRleHRgIGFuZCB0aHVz
IHNraXBwaW5nIHNzcCBzYXZlIGxvZ2ljLiBCdXQgIyBvZiBicmFuY2hlcyBpdAo+PiBpbnRyb2R1
Y2VzIGluIGVhcmx5IGV4Y2VwdGlvbiBoYW5kbGluZyBpcyBlcXVpdmFsZW50IHRvIHdoYXQgY3Vy
cmVudCBwYXRjaGVzCj4+IGRvLiBTbyBJIGRvbid0IHNlZSBhbnkgdmFsdWUgaW4gZG9pbmcgdGhh
dC4KPj4KPj4gTGV0IG1lIGtub3cgaWYgSSBhbSBtaXNzaW5nIHNvbWV0aGluZy4KPgo+UmlnaHQs
IGl0J3MgaGFyZCB0byBhdm9pZCB0aGUgZXh0cmEgYnJhbmNoZXMuCj4KPkkgdGhpbmsgd2UgY291
bGQgbW9kaWZ5IHRoZSBlbnRyeSBwb2ludCAoU1RWRUMpLCBzbyB3ZSBzdGFydCBhdAo+ZGlmZmVy
ZW50IHBhdGhzIGJhc2VkIG9uIGtlcm5lbC91c2Vyc3BhY2UgdHJhcCBhbmQgb25seSBqdW1wIG9u
Y2UgdG8gdGhlCj5jb21tb24gY29kZSwgbGlrZToKPgo+ICBTWU1fQ09ERV9TVEFSVChoYW5kbGVf
ZXhjZXB0aW9uX2tlcm5lbCkKPiAgICAvKiBrZXJuZWwgc2V0dXAgbWFnaWMgKi8KPiAgICBqIGhh
bmRsZV9leGNlcHRpb25fY29tbW9uCj4gIFNZTV9DT0RFX1NUQVJUKGhhbmRsZV9leGNlcHRpb25f
dXNlcikKPiAgICAvKiB1c2Vyc3BhY2Ugc2V0dXAgbWFnaWMgKi8KPiAgaGFuZGxlX2V4Y2VwdGlv
bl9jb21tb246CgpIbW0uLi4gVGhpcyBjYW4gYmUgZG9uZS4gQnV0IHRoZW4gaXQgd291bGQgcmVx
dWlyZSB0byBjb25zdGFudGx5IG1vZGlmeSBgc3R2ZWNgCldoZW4geW91J3JlIGdvaW5nIGJhY2sg
dG8gdXNlciBtb2RlLCB5b3Ugd291bGQgaGF2ZSB0byB3cml0ZSBgc3R2ZWNgIHdpdGggYWRkcgpv
ZiBgaGFuZGxlX2V4Y2VwdGlvbl91c2VyYC4gQnV0IHRoZW4geW91IGNhbiBlYXNpbHkgZ2V0IGEg
Tk1JLiBJdCBjYW4gYmVjb21lCnVnbHkuIE5lZWRzIG11Y2ggbW9yZSB0aG91Z2h0IGFuZCBvbiBm
aXJzdCBnbGFuY2UgZmVlbHMgZXJyb3IgcHJvbmUuCgpPbmx5IGlmIHdlIGhhdmUgYW4gZXh0ZW5z
aW9uIHRoYXQgYWxsb3dzIGRpZmZlcmVudCB0cmFwIGFkZHJlc3MgZGVwZW5kaW5nIG9uCm1vZGUg
eW91J3JlIGNvbWluZyBmcm9tIChhcm0gZG9lcyB0aGF0LCByaWdodD8sIEkgdGhpbmsgeDg2IEZS
RUQgYWxzbyBkb2VzCnRoYXQpCj4KPlRoaXMgaXMgbm90IGEgc3VnZ2VzdGlvbiBmb3IgdGhpcyBz
ZXJpZXMuICBJIHdvdWxkIGJlIHBlcmZlY3RseSBoYXBweQo+d2l0aCBqdXN0IGEgY2xlYW5lciBj
b2RlLgo+Cj5Xb3VsZCBpdCBiZSBwb3NzaWJsZSB0byBoaWRlIHRoZSBBTFRFUk5BVElWRSB1Z2xp
bmVzcyBiZWhpbmQgYSBtYWNybyBhbmQKPm1vdmUgaXQgb3V0c2lkZSB0aGUgY29kZSBibG9jayB0
aGF0IHNhdmVzIHB0X3JlZ3M/CgpTdXJlLCBJJ2xsIGRvIHNvbWV0aGluZyBhYm91dCBpdC4KCj4K
PlRoYW5rcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
