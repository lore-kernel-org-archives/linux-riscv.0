Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41343ECD6D6
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Feb 2026 20:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=46VXP9HEyiue6Y2OsMzQhT9mcSNW8J8UnkBd2JntVk4=; b=vJIngdNd1ldUnX
	Y6Zxy/XIG3SE59XeEZxfECnYWwzJmsA9OB+JD4EmYi6XcBEXUmc+om+5QomkbkxuabMoi79JPNQ12
	ooldmTbIhOrEoFYTes3VUJQOrr2QMfV4LPf580X9GRpyPbdYAIWF1YxS/rVg714apOouvnc+jul9b
	kNZqID82vizlmZc/HUPZPdrpFYoE3wMzqB35fSdYVBVizyLJz9jFiXbKrZtLsDue/uNv74khPz9Ng
	j4cz3Kxwm+W5oQS+y5XCREptUCKgUmH6Bf5L/k//kc3XeOYfsdZkIylY2VbvIJ+UX/C4e8dQStoRd
	u1VqJ9ogDdIVN7RInjjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqGbd-000000010fM-0sKx;
	Wed, 11 Feb 2026 20:14:37 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqGba-000000010dw-0XRy
	for linux-riscv@lists.infradead.org;
	Wed, 11 Feb 2026 20:14:35 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6594382a264so10374729a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Feb 2026 12:14:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770840872; cv=none;
        d=google.com; s=arc-20240605;
        b=JtsHhSXF21xZjM3TnpNVHWxIVSYsAoSfOhL0aIDIuv5kGSNGDjNAyYJYqJ0mGif4U6
         ezLz0rRTpk96iVIfRvLJXuKNzwyS9brC/4LIM9ACV7sufhLEwqW63GuSJc8Gid06tPhD
         nXq+BBLVXRVnrddTTSQlxnBNWAI3rpNAnQCqJFXkjaQHN2DYotWkj5q4cpP5RkTKk7PV
         AZCoxyp0FSKxsP/O54lPQMvx23/BZ0Oq9FUdGBrg+bSHEwXoMjkKNDdg5haIBt7VGylc
         mZcOjiPSBAWI6JjlZnMpN0D6AqP+JYegj2DilSBdHMtLU7J9oPqDXbGAG62SbdxaVlK2
         Cbfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=28hr9LjidhOb4+7vDtUZiT7dYr2nuAMqMlceW5mXuOg=;
        fh=4HTFiDkNXRwdoTs9skiCP/n4PxrpnPYlEZ3dDSDpFBw=;
        b=gjn1OZMHBnmqSJTSCghUjLz70HUxvuBRBxsU5pJpTqNKZMAd8T8BXll2S9PmPZ1Pvr
         62SBhCByNd8RCenyxTNammIxL1xFAeREzPcORJ/QoRN50jWUh9K9glXAvIwTkzu89dJi
         JsOZAZExZlm9Ba7SLQL5maGA4lQTfWLWX/EoQxOqHfsRQ3iAG/2V9JqMoonXlJZJVa0l
         UWnPRAxE634rQDnst2TrcN+aiQEdvF1DpfEh2KK5pNQbq2SyUv/7RH7TLhbzS4pJcgUR
         haC/tV8IojNiYkenIb2a952vyQSZBFjDPI61duZf201JVFMKRW0R0jhBeLN4/PLqfSKx
         dGUQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770840872; x=1771445672; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28hr9LjidhOb4+7vDtUZiT7dYr2nuAMqMlceW5mXuOg=;
        b=cXL7OPgzZLeP94p5p8qWFFSXO7o0jh96MfDHM6vJWTiHC7Pt3CTNoeNxfyf8R4ILs3
         02+IhsD4n6oPnNI8la1R6Kx9+GN9INgLHns/t75kDBjnyRAyMFbTM9p+Y/Cn5UQCPNX/
         Fq5bizvlixPJbXMKwYLvq91x5eZgKXsLM8VHYHxWrOgHDpWLU5IN1SfcJgIQ0yQJ7Kw6
         L9aE1KbcZ71sWEI7omRQJm/xu7BHJz05gPSPDMJRpGAJD+NADZHp35Q6U4EJInurkrIF
         qU5yi6ie58qTQwxRi45pC4n64vJH6hxEQUVgtVAfA8+eb/Hg8u+W8NK1Li0rUeKnVDxq
         hSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770840872; x=1771445672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=28hr9LjidhOb4+7vDtUZiT7dYr2nuAMqMlceW5mXuOg=;
        b=vTQsh/iFhUMjntpNSbJKmXTv0VYABagNyjDMADWhbz7KoyjhG95Z84gqrm039vqeLh
         ZCj9PE2HWcV3fAcU+H3h2bzPOrBd7MpXA9vEbfxaogS/S1nLnlMlEiBHuEgvqHodQqmm
         hJEsClaby6eyoNrfDHJCmWfVnroF/U088yNqtlCF7bhe3ToTgGVGUgcp/RrDYyGfIAJF
         IpThOvY/pksWttdytTcuArwp6gM81gLjUPPBxSJ1ZzeCd/BrXs3iKGR1s7GQDJ0ZzM00
         N9XfEoZB1GzM0GbysrCF+i+m5HpLskDWVwSCOkZQFAHmyK7yPZkye4I1vVjG+2+Avehv
         A2uA==
X-Forwarded-Encrypted: i=1; AJvYcCU+Ef6dUB+SEDU0PH8kSE8hpYHBM5seRW9g5VBtRQGaE+uemllNimcmaV5j0lZ6V/lNtBqsSwioP0wWEg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxfBVmdp3DxG9ZLO92bkSClgpVlw5/u6lQZZjkB9moRH18ebe31
	hVxi9z1vwLFVN+pk5XhXLDye6gZKOTxsBKSlZ3rR4jhxXrs5QDNIm1Jf4Ym1pddvEuwGRgUg+zJ
	+3TXTldnPwPfoSes9TMhTGCzgxgENUxk=
X-Gm-Gg: AZuq6aJ4Vp5ZngxHyYNksabtD+h28uH+NAcliqCyCgwOoYrMYLPv8kOT0t5gqjEYqMK
	d0VSQPIlktr5bcTJvkJ7i3UqhaHjSsis6Vur27fdwp8AStYREiXlinOdpcNW/zoS/XPOpN83/Wv
	NHAYDaT07jfNnFKw7HAVXxrh0MWukyKkU4BSpkpIlZJIBRWneRDpd9b4X1WmsQ8J73dl8HwHuXU
	6c0QMfABGp4oLzJhiZpGZBlRKdUqZ7pgqycXSX3azaNsVUR0kv9erl6awOOYNaOky7bT/t6NcJt
	r+JpEDyIW4RU76mabQ3DaMeI7PZdtTllQwBf9yvrjg==
X-Received: by 2002:a17:907:a08a:b0:b8e:64e:1ed with SMTP id
 a640c23a62f3a-b8f8f72d91emr17643566b.50.1770840871149; Wed, 11 Feb 2026
 12:14:31 -0800 (PST)
MIME-Version: 1.0
References: <20260211103141.3215197-1-rppt@kernel.org> <20260211103141.3215197-4-rppt@kernel.org>
In-Reply-To: <20260211103141.3215197-4-rppt@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 11 Feb 2026 21:14:19 +0100
X-Gm-Features: AZwV_QgdPAvH3hw0825YIt93LQPupYFvh_AV-2zMkwGhubC87cSa2iVxpdoZwag
Message-ID: <CA+=Fv5T07oBJweU3tURD4Nuh7VRWovsf0zjHtA1nDAVNmO=D2w@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arch, mm: consolidate empty_zero_page
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Andreas Larsson <andreas@gaisler.com>, 
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@kernel.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, 
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>, 
	Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, Vineet Gupta <vgupta@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org, 
	x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_121434_248393_406FFA5C 
X-CRM114-Status: GOOD (  23.80  )
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

T24gV2VkLCBGZWIgMTEsIDIwMjYgYXQgMTE6MzLigK9BTSBNaWtlIFJhcG9wb3J0IDxycHB0QGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gRnJvbTogIk1pa2UgUmFwb3BvcnQgKE1pY3Jvc29mdCkiIDxy
cHB0QGtlcm5lbC5vcmc+Cj4KPiBSZWR1Y2UgMjIgZGVjbGFyYXRpb25zIG9mIGVtcHR5X3plcm9f
cGFnZSB0byAzIGFuZCAyMyBkZWNsYXJhdGlvbnMgb2YKPiBaRVJPX1BBR0UoKSB0byA0Lgo+Cj4g
RXZlcnkgYXJjaGl0ZWN0dXJlIGRlZmluZXMgZW1wdHlfemVyb19wYWdlIHRoYXQgd2F5IG9yIGFu
b3RoZXIsIGJ1dCBmb3IgdGhlCj4gbW9zdCBvZiB0aGVtIGl0IGlzIGFsd2F5cyBhIHBhZ2UgYWxp
Z25lZCBwYWdlIGluIEJTUyBhbmQgbW9zdCBkZWZpbml0aW9ucwo+IG9mIFpFUk9fUEFHRSBkbyB2
aXJ0X3RvX3BhZ2UoZW1wdHlfemVyb19wYWdlKS4KPgo+IE1vdmUgTGludXMgdmV0dGVkIHg4NiBk
ZWZpbml0aW9uIG9mIGVtcHR5X3plcm9fcGFnZSBhbmQgWkVST19QQUdFKCkgdG8gdGhlCj4gY29y
ZSBNTSBhbmQgZHJvcCB0aGVzZSBkZWZpbml0aW9ucyBpbiBhcmNoaXRlY3R1cmVzIHRoYXQgZG8g
bm90IGltcGxlbWVudAo+IGNvbG9yZWQgemVybyBwYWdlIChNSVBTIGFuZCBzMzkwKS4KPgo+IFpF
Uk9fUEFHRSgpIHJlbWFpbnMgYSBtYWNybyBiZWNhdXNlIHR1cm5pbmcgaXQgdG8gYSB3cmFwcGVy
IGZvciBhIHN0YXRpYwo+IGlubGluZSBjYXVzZXMgc2V2ZXJlIHBhaW4gaW4gaGVhZGVyIGRlcGVu
ZGVuY2llcy4KPgo+IEZvciB0aGUgbW9zdCBwYXJ0IHRoZSBjaGFuZ2UgaXMgbWVjaGFuaWNhbCwg
d2l0aCB0aGVzZSBiZWluZyBub3Rld29ydGh5Ogo+Cj4gKiBhbHBoYTogYWxpYXNlZCBlbXB0eV96
ZXJvX3BhZ2Ugd2l0aCBaRVJPX1BHRSB0aGF0IHdhcyBhbHNvIHVzZWQgZm9yIGJvb3QKPiAgIHBh
cmFtZXRlcnMuIFN3aXRjaGluZyB0byBhIGdlbmVyaWMgZW1wdHlfemVyb19wYWdlIHJlbW92ZXMg
dGhlIGFsaWFzaW5nCj4gICBhbmQga2VlcHMgWkVST19QR0UgZm9yIGJvb3QgcGFyYW1ldGVycyBv
bmx5Cj4gKiBhcm02NDogdXNlcyBfX3BhX3N5bWJvbCgpIGluIFpFUk9fUEFHRSgpIHNvIHRoYXQg
ZGVmaW5pdGlvbiBvZgo+ICAgWkVST19QQUdFKCkgaXMga2VwdCBpbnRhY3QuCj4gKiBtNjhrL3Bh
cmlzYy91bTogYWxsb2NhdGVkIGVtcHR5X3plcm9fcGFnZSBmcm9tIG1lbWJsb2NrLAo+ICAgYWx0
aG91Z2ggdGhleSBkbyBub3Qgc3VwcG9ydCB6ZXJvIHBhZ2UgY29sb3JpbmcgYW5kIGhhdmluZyBp
dCBpbiBCU1MKPiAgIHdpbGwgd29yayBmaW5lLgo+ICogc3BhcmM2NCBjYW4gaGF2ZSBlbXB0eV96
ZXJvX3BhZ2UgaW4gQlNTIHJhdGhlciBhbGxvY2F0ZSBpdCwgYnV0IGl0Cj4gICBjYW4ndCB1c2Ug
dmlydF90b19wYWdlKCkgZm9yIEJTUy4gS2VlcCBpdCdzIGRlZmluaXRpb24gb2YgWkVST19QQUdF
KCkKPiAgIGJ1dCBpbnN0ZWFkIG9mIGFsbG9jYXRpbmcgaXQsIG1ha2UgbWVtX21hcF96ZXJvIHBv
aW50IHRvCj4gICBlbXB0eV96ZXJvX3BhZ2UuCj4gKiBzaDogdXNlZCBlbXB0eV96ZXJvX3BhZ2Ug
Zm9yIGJvb3QgcGFyYW1ldGVycyBhdCB0aGUgdmVyeSBlYXJseSBib290Lgo+ICAgUmVuYW1lIHRo
ZSBwYXJhbWV0ZXJzIHBhZ2UgdG8gYm9vdF9wYXJhbXNfcGFnZSBhbmQgbGV0IHNoIHVzZSB0aGUg
Z2VuZXJpYwo+ICAgZW1wdHlfemVyb19wYWdlLgo+ICogaGV4YWdvbjogaGFkIGFuIGFtdXNpbmcg
Y29tbWVudCBhYm91dCBlbXB0eV96ZXJvX3BhZ2UKPgo+ICAgICAgICAgLyogQSBoYW5keSB0aGlu
ZyB0byBoYXZlIGlmIG9uZSBoYXMgdGhlIFJBTS4gRGVjbGFyZWQgaW4gaGVhZC5TICovCj4KPiAg
IHRoYXQgdW5mb3J0dW5hdGVseSBoYWQgdG8gZ28gOikKPgo+IEFja2VkLWJ5OiBIZWxnZSBEZWxs
ZXIgPGRlbGxlckBnbXguZGU+ICAgIyBwYXJpc2MKPiBUZXN0ZWQtYnk6IEhlbGdlIERlbGxlciA8
ZGVsbGVyQGdteC5kZT4gICMgcGFyaXNjCj4gUmV2aWV3ZWQtYnk6IENocmlzdG9waGUgTGVyb3kg
KENTIEdST1VQKSA8Y2hsZXJveUBrZXJuZWwub3JnPgo+IEFja2VkLWJ5OiBEYXZlIEhhbnNlbiA8
ZGF2ZS5oYW5zZW5AbGludXguaW50ZWwuY29tPgo+IEFja2VkLWJ5OiBDYXRhbGluIE1hcmluYXMg
PGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tPgo+IFNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQg
KE1pY3Jvc29mdCkgPHJwcHRAa2VybmVsLm9yZz4KPiAtLS0KPiAgYXJjaC9hbHBoYS9pbmNsdWRl
L2FzbS9wZ3RhYmxlLmggICAgICAgICAgfCAgNiAtLS0tLS0KCj4gZGlmZiAtLWdpdCBhL2FyY2gv
YWxwaGEvaW5jbHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC9hbHBoYS9pbmNsdWRlL2FzbS9wZ3Rh
YmxlLmgKPiBpbmRleCA5MGU3YTk1MzkxMDIuLjEyYTNjNWY4ZWNlOCAxMDA2NDQKPiAtLS0gYS9h
cmNoL2FscGhhL2luY2x1ZGUvYXNtL3BndGFibGUuaAo+ICsrKyBiL2FyY2gvYWxwaGEvaW5jbHVk
ZS9hc20vcGd0YWJsZS5oCj4gQEAgLTEyNSwxMiArMTI1LDYgQEAgc3RydWN0IHZtX2FyZWFfc3Ry
dWN0Owo+ICAgKi8KPiAgI2RlZmluZSBwZ3Byb3Rfbm9uY2FjaGVkKHByb3QpIChwcm90KQo+Cj4g
LS8qCj4gLSAqIFpFUk9fUEFHRSBpcyBhIGdsb2JhbCBzaGFyZWQgcGFnZSB0aGF0IGlzIGFsd2F5
cyB6ZXJvOiAgdXNlZAo+IC0gKiBmb3IgemVyby1tYXBwZWQgbWVtb3J5IGFyZWFzIGV0Yy4uCj4g
LSAqLwo+IC0jZGVmaW5lIFpFUk9fUEFHRSh2YWRkcikgICAgICAgKHZpcnRfdG9fcGFnZShaRVJP
X1BHRSkpCj4gLQo+ICAvKgo+ICAgKiBPbiBjZXJ0YWluIHBsYXRmb3JtcyB3aG9zZSBwaHlzaWNh
bCBhZGRyZXNzIHNwYWNlIGNhbiBvdmVybGFwIEtTRUcsCj4gICAqIG5hbWVseSBFVjYgYW5kIGFi
b3ZlLCB3ZSBtdXN0IHJlLXR3aWRkbGUgdGhlIHBoeXNhZGRyIHRvIHJlc3RvcmUgdGhlCgpUaGlz
IGxvb2tzIGdvb2QgZnJvbSBhbiBBbHBoYSBwZXJzcGVjdGl2ZQoKQWNrZWQtYnk6IE1hZ251cyBM
aW5kaG9sbSA8bGlubWFnN0BnbWFpbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
