Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D455606A31E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 05:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vUClOVsC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=vKmbRd2z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IABvtjThiDGvjWk/SC7mCR3GQO37qNfTpftWN3sOGR4=; b=vUClOVsC3k7Sx3aTj5o94+bSiC
	iDcBKULopYaKphwjQoVTBo+Kdcp7dkEXI6OJmp2g6iaLHoMYOG4Ets5M+dXWAvTmzKOs2BXcM7cP1
	b4g7uKEtcN/KcyhTZqMsIug6FLyacv2FnbpWd0V7fVdbTcYdNVYWIEh4RB692M8TaWvF4zD0JmInH
	JEfy+q3HwjPuuPnB2pUSWeGABH6lW6g5isXKW9WRs7XVRdsmJSZrJQAnfq6Z6jlP+FXmnWYCM2E5m
	XqMMbcwzgc4R+yjZUD128GTKHGyx8NsDHJo0nDJYePIY7Uj5JBo2o1AhQQV4ZUtNc2ds21fqi9gCB
	B8RIFhag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW5tn-00000008UWp-3DPz;
	Wed, 25 Nov 2026 05:50:31 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW5tk-00000008UTD-0PyX
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 05:50:29 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so4054014f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2026 21:50:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795585826; cv=none;
        d=google.com; s=arc-20260327;
        b=iRDSj3zu+aQQko53l7JgJtuQk+UAJHdI83oyUIqwGw48UzljrB+56aGac35tUqGQh/
         +FS4JaCtz2Hu2nX6xyxJKSjBFZOq7kmTlfGnwHt/pg0WUZinZEhjdHiiNLly/WVal82E
         Hw/YpBynXpkMchpBbdprquyWr/N7CTXMcBJc86xxdcMzhtDx6xnXdgCo7tcSMcpNs37d
         af4l/grh3uybWmyy17Jf5uS8QgB61f75I7/FpsPNDbUObccrS1Fh8mYSM0efaCfq6+03
         S88vB/GFdvmZdNrQQpN8V4JJx43g20wdwPgScHlbNuc7WQT9Tx8lQd9Y/O3+zxIE9a33
         TJBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h0QzRh8muxydOHGjX2h5cehhw+NrrMdYMgJiE84UVD4=;
        fh=jnN/LO0ymBytdeFPhnUCqRwX2WRed1bGaf6+i7mXRGg=;
        b=WtjM8AVnFyKUHzMJCoZ1HqTH6EJiwLUbDJYJtO8njO+bzHVwngijq3DysNTyAakrfx
         g5mYKcj2Kr56zfZGvknsHU+XChUHUUaur+OXBCJaK1ZZJmVONQFz7REjfZdQqryCRQRh
         u7nKLsxRcbPXjP6sShjSgQq6hz+6IW+JMUCLeDcbpuFcT29MTAzSwTjvvCKT8spWchtf
         n3YXlvIg4TzohIuuNBUDVpPKdCdgRNW15gOvQzd4b6/MFS2MDNgm5sD+1AKC6w9uPM5q
         BPuL/WDGl5hiKATIA4BYkyFQLCZFVcWNWvipPdlY0jPbQiCAVqNW1ksDyq3sdjNz0hxO
         FUKQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795585826; x=1796190626; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h0QzRh8muxydOHGjX2h5cehhw+NrrMdYMgJiE84UVD4=;
        b=vKmbRd2zuEOcZToO6E9Ed0YL9CZt+uZwh7JgLAHEm+wYquneeOrQuafQRskLagaQ+y
         /i3OyKg41MHy7HkPU8SpQ7ReGg2lEYgBHDNi6zOJe0hS7QSjo2px2xZbTsh8doygUTC7
         oXZ6iVElRNQESyivoKuLSD7P5fUBjDQz3bUMP36F+uzafEdGfexHnf7clArydla7IJ5T
         3yyBmr9WuU1Zn1zYgfgkp9TO1sykIFGXMCrtv2yCKrk5rUIvMzRVhGIYoc4onOsGlg6V
         8syKcb88bWbZ76zfO4IdkY9EvmpAjV/RltM4affYf9Rrsg/FaERdzXpJ0gn3u5ZOwkt1
         ks9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795585826; x=1796190626;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h0QzRh8muxydOHGjX2h5cehhw+NrrMdYMgJiE84UVD4=;
        b=hHvfIpvZVU7RMIsRrXaGPLUttcQomIMUVYfCIQu7fImOlOyuIcdgP0skeZvASVqKj4
         yb1h8tKLZxL3TZMKYKxWfCiWxbM2zzwo0A2vCQtshcjf08hTE14QHZZgv7W6kp+k6TTU
         gDpqoaIAMrSWCOGtiKqmL/vqA9xfzia8ovSC5pzvqYz5m7OVAys6vFQs4qcjDKGQLGX2
         K3cYycBn07a7MqvWjmEs7XjbD1u0nX4VI4vbjcywAEKE9BtAM2FSv4YhwCbskM717keC
         8jkMYrOJflV8H1p9W7sd55/tSe4CpIX6YyNWA78qZBrMQrz7i/AUQGc7YRFCkDiv/rye
         /9hA==
X-Forwarded-Encrypted: i=1; AL+hErEJfGPjT2y/yS23TMf1pcF0NFu9jw/Ox4iPyG8+/ja3JAZfM0oH76ZMGFFZ1cTfPW4+hsnmD4VoTWyIBw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9CU2dxQz0OWchszJeQ0ifgc0UyL+2TXbN6MxvCAhgtBBeg4Dwp
	v8/2vNGNT7jiH2tvCPFYF+K4N4MB/t7VKEE63VNWB7cRDWnylV5GUlqxflhOH2oCACxgicViqR1
	AskXXhk4wB4yKY/frm1qH8k84xG67707YIaTqttjRuA==
X-Gm-Gg: AZFdTZcmqKEYiF2UFGGF7afmnj1g1iVE/GEcC2fWcpy1gVW/LpVrAi+B2qXka5+iWgw
	4kj6d2sZae7b3SJ3TaJcxbCuePzyCqewz1MC3n5aEApbLfS2Qm54Me7kyRO8BocaHcBLIBtzU1O
	QicxI1/EYRwFmmz8D6Hal0Gp3QUi5HO83MwuhRNUOPjQw0vKmKUkjJ0ZZSiStL5PPykiO6FScza
	QHCP/y4WSng3zkgNv403Z2nf2qIH8WpOfG/oX6lZdRRUZEPH5+9EABhd0s430Zkm/GCRyVYfUjU
	E4iFuWvwnTh4CBFCxbw6BO4qEnTOFUdBZIv9SvT0R/TEWq6bkjHg9XJWEuxogjzZ+jnOK8Dw0RI
	9zJhFSoqTPvA4OLozRUxi+XzuX2UPsK2hiSKfCFZ8PLCFbglWFtVBSy51cOtvLlZkt+7WnZERBz
	26B+g4CnFoqJNOpBnp3MSudxhuLi0qVjTaNwKM1tw9elK9zmXo8mQ/MAo=
X-Received: by 2002:adf:e00f:0:20b0:48e:932:aefa with SMTP id
 ffacd0b85a97d-4abb27268e7mr22701177f8f.26.1795585826178; Tue, 24 Nov 2026
 21:50:26 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260921111402.120911-1-suunj1331@gmail.com> <20260921111402.120911-6-suunj1331@gmail.com>
In-Reply-To: <20260921111402.120911-6-suunj1331@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 25 Nov 2026 11:20:14 +0530
X-Gm-Features: Aa3M54oFEe_Kg5fzllo_hPF_KMY1sHlitMVjRaBnJClbHNybVQLzGtgAKkyplS4
Message-ID: <CAAhSdy3-0fHHE2tpRRimhOTUWrN01Ju8Mdt4=R1UUp1atwsifA@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] KVM: riscv: Age G-stage PTEs locklessly
To: SeungJu Cheon <suunj1331@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Paolo Bonzini <pbonzini@redhat.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Jinyu Tang <tjytimi@163.com>, 
	Wang Yechao <wang.yechao255@zte.com.cn>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_215028_149050_077B4CEC 
X-CRM114-Status: GOOD (  13.36  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBTZXAgMjEsIDIwMjYgYXQgNDo0NOKAr1BNIFNldW5nSnUgQ2hlb24gPHN1dW5qMTMz
MUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQWdpbmcgRy1zdGFnZSBQVEVzIGN1cnJlbnRseSBydW5z
IHdpdGggbW11X2xvY2sgaGVsZCBmb3Igd3JpdGUsIHRha2VuCj4gYnkgdGhlIGNvbW1vbiBNTVUg
bm90aWZpZXIgY29kZS4gV2hlbiBNR0xSVSBvciBrc3dhcGQgYWdlcyBhIGxhcmdlCj4gcmFuZ2Us
IGV2ZXJ5IHZDUFUgdGFraW5nIGEgRy1zdGFnZSBmYXVsdCBibG9ja3Mgb24gdGhlIGxvY2ssIGFu
ZCB0aGUKPiBkaXJ0eS1sb2dnaW5nIHJlYWQtc2lkZSBmYXN0IHBhdGggYmxvY2tzIGJlaGluZCBh
Z2luZyBhcyB3ZWxsLgo+Cj4gVGhlIHByZWNlZGluZyBwYXRjaGVzIHByZXBhcmUgRy1zdGFnZSBw
YWdlLXRhYmxlIHdhbGtzIGZvciBsb2NrbGVzcwo+IGFnaW5nIGJ5IHVzaW5nIGNvbnNpc3RlbnQg
UFRFIHNuYXBzaG90cywgcHJlc2VydmluZyBjb25jdXJyZW50Cj4gQWNjZXNzZWQtYml0IHVwZGF0
ZXMsIGFuZCBkZWZlcnJpbmcgcGFnZS10YWJsZSBmcmVlcyB3aXRoIFJDVS4KPgo+IFNlbGVjdCBL
Vk1fTU1VX0xPQ0tMRVNTX0FHSU5HIHNvIHRoZSBjb21tb24gY29kZSBubyBsb25nZXIgdGFrZXMK
PiBtbXVfbG9jayBmb3IgYWdpbmcsIGFuZCBwcm90ZWN0IHRoZSBHLXN0YWdlIHdhbGsgd2l0aCBh
biBSQ1UgcmVhZC1zaWRlCj4gY3JpdGljYWwgc2VjdGlvbi4KPgo+IFJlYWQgdGhlIHJvb3QgaW5z
aWRlIHRoZSBSQ1UgcmVhZC1zaWRlIGNyaXRpY2FsIHNlY3Rpb24gYW5kIGNoZWNrIHRoZQo+IHJl
c3VsdGluZyBzbmFwc2hvdCBpbnN0ZWFkIG9mIGNoZWNraW5nIGt2bS0+YXJjaC5wZ2Qgc2VwYXJh
dGVseSBiZWZvcmUKPiBpbml0aWFsaXppbmcgdGhlIEctc3RhZ2UgY29udGV4dC4gVGhpcyBlbnN1
cmVzIHRoYXQgdGhlIHJvb3QgdXNlZCBieQo+IHRoZSB3YWxrIHJlbWFpbnMgcHJvdGVjdGVkIHVu
dGlsIHRoZSB3YWxrIGNvbXBsZXRlcy4KPgo+IE9uIFFFTVUgVENHIHdpdGggNCB2Q1BVcywgcnVu
bmluZyBkaXJ0eV9sb2dfcGVyZl90ZXN0IC12IDMgLWIgMjU2TSAtaSAzCj4gd2l0aCBNR0xSVSBh
Z2luZyBvZiB0aGUgVk0ncyBjZ3JvdXAgZm9yY2VkIGV2ZXJ5IDEwMG1zICg4NiBwYXNzZXMpOgo+
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmVmb3JlICAgICAgYWZ0ZXIKPiAgIG1t
dV9sb2NrIHdyaXRlIHdhaXQsIHRvdGFsICA0NC40IHMgICAgICAwLjE1IHMKPiAgIG1tdV9sb2Nr
IHdyaXRlIGNvbnRlbnRpb25zICAxLDAwMiwwOTIgICAzMCwwOTIKPiAgIG1tdV9sb2NrIHJlYWQg
Y29udGVudGlvbnMgICAzNTEsOTM3ICAgICAwCj4gICBndWVzdCBkaXJ0eS1tZW1vcnkgdGltZSAg
ICAgMTguNiBzICAgICAgMTYuNyBzCj4KPiBCZWZvcmUsIDkzJSBvZiB3cml0ZS1sb2NrIHdhaXRl
cnMgd2VyZSBrdm1fbW11X25vdGlmaWVyX2NsZWFyX3lvdW5nKCkuCj4gV2l0aCBubyBhZ2luZywg
bm8gbWVhbmluZ2Z1bCBkaWZmZXJlbmNlIHdhcyBvYnNlcnZlZCBiZXR3ZWVuIHRoZSB0d28KPiBr
ZXJuZWxzLgo+Cj4gU2lnbmVkLW9mZi1ieTogU2V1bmdKdSBDaGVvbiA8c3V1bmoxMzMxQGdtYWls
LmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
