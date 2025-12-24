Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF901E75423
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Dec 2025 08:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=On57rNVtq5D95atFEDzbCsCfZLqLvhiPEG2YJAIpano=; b=3apGZC2632ky/B
	WG1IZ2isEyiGQ0MpMph0FNQGuOBN6E0vnWhjVwMMvOC6uYKJuLF5JrrsNlTZ14OjXedHNJt3c3Zk0
	/li61Z/snHk5ydcRZT/d6czkgAH7A8Nm6Mv8jGYgojx4FCO/7QyP7OD5miDdRfmhQpTQPtwMPV+tJ
	EYHb3xATllwXCXeI7sDeiPgOYgMD5RD9ITDRG0Knu1T1mF4SJ2HjwwZGc+2IpPUAfXpE5FObZus4y
	SFD8udpjXlwgp3d5F5g3uMXRpmcKMCq2km/XElpvF+hZvEhQlAPFOA4ppoznU/fUEsDUQdwASqsnK
	HEVwh6aQA1/sQS7m4fEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYKQH-0000000GaYZ-3axY;
	Wed, 24 Dec 2025 08:40:45 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYKQF-0000000GaY6-2kY1
	for linux-riscv@lists.infradead.org;
	Wed, 24 Dec 2025 08:40:45 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-3f13043e2fdso1962851fac.1
        for <linux-riscv@lists.infradead.org>; Wed, 24 Dec 2025 00:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1766565638; x=1767170438; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+IWXlq6Bey332UZx5McZ37yF55t1q00uHD8DCVcWERc=;
        b=kdIaM6+nOQtXbJEjm0qxQdmlnkwWq9xKI8NITTqZwDGB9kgPUKzQZmG2lXUSyS5OAQ
         90apxRwuFKO9giVWnqHMA72upG+j26/mjp+nWhWxUodJOOzJSrtufswHk3Yy3zfuJU++
         pKfiIZXTgTKBGT1otGQsbTPMnUKNqJQiyREsGHvy+SZdmpeSZtQFXFeAxl+4g/O7zL2e
         uwHGORWce4jWW/qo637TQzExk5V6PdBBt13Q6Dsoys6QL9p3HvIvwUddjO9hwddMjJcO
         KDHymI8PwssdJstmaYUvMffMMC53Y6Mco4FMgbvlF2LTp7VwsbuiFKibqSExD7cjAoIo
         qSIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766565638; x=1767170438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+IWXlq6Bey332UZx5McZ37yF55t1q00uHD8DCVcWERc=;
        b=jmKoPByOejNbAfGJOkWQ0kk+Opg5R8FzTbMKuCqeERNE13lAUwwE+xSgK5JVNUYExy
         Lau6QrWDixYfBSzvRzDR9+7qIdzl+Tr/S3u2EHdOu0YVUMcwWI8DwbxhoOg44EDqEMNG
         tRzDW3cdVk/wXSaWFk2O1U8uyZr388zvnBEh1epjuAbFuOEcx6+2+LrXWR8xxr9oB+xe
         b9KP3AOFHyU7PSd2N4UWKf1ZTZZygFLesDjFeZwYkb0P0QJVpfRc1wtj0V3iDy01Hcdx
         WicAapTpdgpYdOUUCjIUiYxG40RQo3GUYhnXHETehm5DtuV4T/mTyimyotXxsz58/J1Y
         JHHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZtBd5dv5rN78KWPQRDkDkQkG5oGz/a7LhRCeCRrIu+EXpdqvSxQ7mKxjFMApbVJNTO68fGo8sVkmDvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPAWdmxnH7L6CZbzTw2asUmBZhMmdP4r4ZWMC6akTstOd8adrE
	5eGjeoigwBLBwh+HlI+pIJAmyhpdWz7j1V3pCPlmsMXESbhX58B1puG80mHn5KlfJai3TixkhqW
	VxMP4SiW2KN9Tm096JuB06g+S9tADb0JyFlp/0slC4Q==
X-Gm-Gg: AY/fxX53tdvXcyCsttAYd94LtdgJY+NSeSwis5gGyycGj/LRhFfGbktILarx8zZiPvf
	R8asRa3w8VtjJPXewGuP/OdMEdIlHFzhARK5qp9EvHG1DSQ7J7nEquNaPLarLilgBGPG4+OmSnu
	MkYP30xpCT6NPAnHTWY0IRp/JTxZG2v4Sc2c9oNJb6aO/vif4W4yPxfdjU8H1yw5M/1mpxknsAa
	ihof+u7OyV8wjq7W8Q+rcOqEnWcMs0DwAT24XOH8iXlLYALfkrIPFkIRu5JdmL+6F1kbmFNCbW1
	U6N939Wa
X-Google-Smtp-Source: AGHT+IG3wj5Yb5O1Tr6QGFvLEaY3zJyPJglD4dFE8oW7oMXIoCyOvUy2LrdCNwD6Wiwdm+Y5VWlhMUUaGdoMyJMgPpE=
X-Received: by 2002:a4a:c105:0:b0:657:64ce:b40f with SMTP id
 006d021491bc7-65d0e9235b9mr5638792eaf.4.1766565637601; Wed, 24 Dec 2025
 00:40:37 -0800 (PST)
MIME-Version: 1.0
References: <20251007-ssqosid-v4-0-e8b57e59d812@kernel.org>
 <CAEEQ3w=3pte5=CR9-R3rmCGFZ9ErJ9YcWS9i=JwPUb1Ty3ipwQ@mail.gmail.com> <aOmA8DNt/y+WxT97@x1>
In-Reply-To: <aOmA8DNt/y+WxT97@x1>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 24 Dec 2025 16:40:26 +0800
X-Gm-Features: AQt7F2pNmvSj8a3TBiZmOZWqbErCH9Gsey7cqL9mu2cYOMvRWg3JypE3j0egH4s
Message-ID: <CAEEQ3wmHH6=ZNCEq3hV6Cmf7gGd0kZsH-3VYr6awZmPCz8h_cA@mail.gmail.com>
Subject: Re: [External] [PATCH v4 0/3] RISC-V: Detect Ssqosid extension and
 handle srmcfg CSR
To: Drew Fustini <fustini@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
	Adrien Ricciardi <aricciardi@baylibre.com>, James Morse <james.morse@arm.com>, 
	Atish Kumar Patra <atishp@rivosinc.com>, Atish Patra <atish.patra@linux.dev>, 
	Vasudevan Srinivasan <vasu@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, guo.wenjia23@zte.com.cn, 
	liu.qingtao2@zte.com.cn, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_004043_811480_446F9EF4 
X-CRM114-Status: GOOD (  24.78  )
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

SGkgRHJldywKClszXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA5MTAyMDQzMDku
MjA3NTEtMS1qYW1lcy5tb3JzZUBhcm0uY29tLwpzZWVtcyB0byBoYXZlIGJlZW4gbWVyZ2VkIGlu
dG8gdGhlIG1haW5saW5lLiBEbyB5b3UgcGxhbiB0byBzdWJtaXQgYQpzZXJpZXMgb2Ygc3Nxb3Np
ZCArIGNicXJpIHBhdGNoZXMgd2l0aCBBQ1BJIHN1cHBvcnQ/CgpUaGFua3MsCll1bmh1aQoKT24g
U2F0LCBPY3QgMTEsIDIwMjUgYXQgNTo1NuKAr0FNIERyZXcgRnVzdGluaSA8ZnVzdGluaUBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgT2N0IDEwLCAyMDI1IGF0IDA4OjIzOjUwUE0gKzA4
MDAsIHl1bmh1aSBjdWkgd3JvdGU6Cj4gPiBIaSBEcmV3LAo+IFtzbmlwXQo+ID4gPiBJIHRoaW5r
IGl0IG1ha2VzIHNlbnNlIHRvIGZpcnN0IGZvY3VzIG9uIHRoZSBkZXRlY3Rpb24gb2YgU3Nxb3Np
ZCBhbmQKPiA+ID4gaGFuZGxpbmcgb2Ygc3JtY2ZnIHdoZW4gc3dpdGNoaW5nIHRhc2tzLiBJdCBo
YXMgYmVlbiB0ZXN0ZWQgYWdhaW5zdCBhCj4gPiA+IFFFTVUgYnJhbmNoIHRoYXQgaW1wbGVtZW50
cyBTc3Fvc2lkIGFuZCBDQlFSSSBbNl0uIEEgdGVzdCBkcml2ZXIgWzddCj4gPiA+IHdhcyB1c2Vk
IHRvIHNldCBzcm1jZmcgZm9yIHRoZSBjdXJyZW50IHByb2Nlc3MuIFRoaXMgYWxsb3dzIHN3aXRj
aF90bwo+ID4gPiB0byBiZSB0ZXN0ZWQgd2l0aG91dCByZXNjdHJsLgo+ID4KPiA+IENvdWxkIHdl
IGNvbnNpZGVyIHN1Ym1pdHRpbmcgdGhlIGVudGlyZSBRb1MgZnVuY3Rpb25hbGl0eSBhcyBhIHNp
bmdsZQo+ID4gaW50ZWdyYXRlZCBwYXRjaHNldCAoaW5kaWNhdGluZyB0aGUgdXBzdHJlYW0gYnJh
bmNoIHRoYXQgdGhlIHBhdGNoc2V0Cj4gPiBpcyBiYXNlZCBvbik/IFRoaXMgc2hvdWxkIGluY2x1
ZGUgdGhlIGNvbnRlbnQgZnJvbQo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlz
Y3YvMjAyMzA0MTkxMTExMTEuNDc3MTE4LTEtZGZ1c3RpbmlAYmF5bGlicmUuY29tLwo+Cj4gVGhh
bmtzIGZvciB0aGUgZmVlZGJhY2suIEkgaGFkIHRob3VnaHQgdGhhdCBzdWJtaXR0aW5nIFNzcW9z
aWQKPiBzZXBhcmF0ZWx5IHdvdWxkIHN0cmVhbWxpbmUgdGhlIHJldmlldyBvZiB0aGUgcGFydHMg
dGhhdCBtb3N0IGFmZmVjdHMKPiBleGlzdGluZyBhcmNoL3Jpc2N2IGNvZGUgKGxpa2Ugc3dpdGNo
X3RvLmgpIGJlZm9yZSBhZGRpbmcgY29kZSBmb3IgQ0JRUkkKPiBhbmQgcmVzY3RybCBpbnRlZ3Jh
dGlvbi4KPgo+IEJ1dCBJIGhhdmUgZ290dGVuIHNpbWlsYXIgZmVlZGJhY2sgZnJvbSBhbm90aGVy
IHBlcnNvbiB0b28uIEkgY2FuIHBvc3QgYQo+IGNvbXBsZXRlIHNlcmllcyB0aGF0IGFkZHMgU3Nx
b3NpZCBhbmQgQ0JRUkkgc3VwcG9ydCBpbmNsdWRpbmcgdGhlCj4gcmVzY3RybCBpbnRlcmZhY2Uu
IEkgaGF2ZSBhIGNicXJpIGJyYW5jaCBbMV0gb24gdG9wIG9mIHJpc2N2L2Zvci1uZXh0Lgo+IEkg
bmVlZCB0byBjbGVhbiB1cCBzb21lIG9mIHRoZSBjb2RlLCBhbmQgdGhlbiBJIGNhbiBzZW5kIGEg
c2VyaWVzIHdpdGgKPiBzc3Fvc2lkK2NicXJpLgo+Cj4gVGhhdCBjYnFyaSBicmFuY2gganVzdCBo
YXMgZGV2aWNlIHRyZWUgc3VwcG9ydCBpbiBvcmRlciB0byBkZW1vbnN0cmF0ZQo+IHRoZSByZXNj
dHJsIGZ1bmN0aW9uYWxpdHkuIEhvd2V2ZXIsIEkgZGlkIGFsc28gd29yayBvbiBzdXBwb3J0IGZv
ciB0aGUKPiBBQ1BJIFJRU0MgdGFibGUgZWFybGllciB0aGlzIHllYXIgZm9yIGEgcHJvb2Ygb2Yg
Y29uY2VwdCBbMl0uIEkgaGF2ZQo+IGJlZW4gdGhpbmtpbmcgdGhhdCBJIHdpbGwgaG9sZCBiYWNr
IHRoZSBBQ1BJIHN1cHBvcnQgdW50aWwgYWZ0ZXIgU3Nxb3NpZAo+IGFuZCBDQlFSSSBzdXBwb3J0
IGlzIHJldmlld2VkLiBJdCBhbHNvIGRlcGVuZHMgb24gc29tZSBpbXByb3ZlbWVudHMKPiByZWdh
cmRpbmcgdGhlIEFDUEkgUFBUVCB0YWJsZSB0aGF0IEphbWVzIE1vcnNlIGlzIGN1cnJlbnRseSB3
b3JraW5nIG9uIGZvcgo+IEFSTSBNUEFNIHN1cHBvcnQgWzNdLgo+Cj4gVGhhbmtzLAo+IERyZXcK
Pgo+IFsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9m
dXN0aW5pL2xpbnV4LmdpdC9sb2cvP2g9YjQvY2JxcmkKPiBbMl0gaHR0cHM6Ly9sZi1yaXNlLmF0
bGFzc2lhbi5uZXQvd2lraS9zcGFjZXMvSE9NRS9wYWdlcy80MzMyOTEyNzIvQUNQSStSUVNDK1By
b29mK29mK0NvbmNlcHQKPiBbM10gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwOTEw
MjA0MzA5LjIwNzUxLTEtamFtZXMubW9yc2VAYXJtLmNvbS8KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
