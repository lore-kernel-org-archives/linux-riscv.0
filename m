Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD43606A31E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 14:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k/HpkIrj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aD244ynP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=p8C9QRPVkGXMeCIO8seI0pE+RI1ETpfgHSSdRnPSxGs=; b=k/HpkIrjRofrOkgrniQaSvpJgk
	fKZCNFj9zumIle6s1XITL+heDqBKO6tbnd7PSpMf9NhPioeU/6I0ny2B4y2Fe1mJWzrdycPlrA/RD
	LwwwmyQt+MSj6VyIbEOv7nPEOKiR93ZLIp717Q8X7dCWwIJ1HVRPvUsJn5VDIsbJVEe/b0vbcVmHc
	/tWmsVbY8J1jbiq1exRUoqKoL97+9SbUfRyB4mSj9/5XvjRMLvV8maBrSMGNdWk65TpTZlVDXtlLR
	zjbVizWS3BJUI9KMpof2/cRdF2Qbu5b82Er3fMnWLqEore9dXoUbRir7U9PoK97pdwJqz1Iej7gaD
	4GycttvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDt2-0000000A8by-12hg;
	Wed, 25 Nov 2026 14:22:16 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDsv-0000000A8ah-1X6N
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 14:22:14 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6ba12b00c76so6115453a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 06:22:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795616527; cv=none;
        d=google.com; s=arc-20260327;
        b=p/xHTkRKem9ak4CFYzp0dLG1btIr9qWwS68CBrHAWPBC9x217hwEp0QT3P++uYj0Sk
         7bQVSNaPUZMd5/Mqadq2pkvBbn3L+4wquZ6o/OZxzrgAbYmrUGTsaWNubmObBRYanwNI
         /ZC9haSWYv2+6NtrMK3XRYxG9eyEeCcuqc2X48PEcddxD40pUsIQl0VjlJCFYDIEusBD
         PUQ7nyPteG0p8IPrH8PaWoiHdXwBUej4bYl26YiVnyVPJ9+prGCKwgtTQS+Vud+mszSh
         V1f4FYBECsbSM8s5sB1utiVYR16sxcANEAXbNmh0fvCVAgvnbpH0//17esYkZ4NqbXmO
         eghQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qcxgI/Ns4WvtOt6H6UP0HsEplcfIU7aicu4QDdc3bw8=;
        fh=LSKlLaKSMT1Y4Bvwix0zpF2tGNB469IHio1R/qRBElg=;
        b=jZgKvPIugHbnr6kOK03RcAcCRfzpFnHUxVhOB7mjvOs4VSGw3MsOSIO08MHTPoEyBW
         VvFVSAYkOl2c3DjTWow2SKlskyxSkFcyfBmPv+E/W4WNNsYVRMu1yNTM/8OHZH8GMrs6
         SbhJ1PJo/Zz0hUOdsxq/B3a8RN54HJWJ4XznbSoAom1RyRaF+XIn75uHfCEZIvAa76+O
         sndSNYgnbdrnwa0lsyUy3H3CkUFrasW2hpz6rpoFyxWhhslE6PzmiDmKuThodb9lI8Hh
         fQgJKY97/rgmjUwO6MJXgleKX2ZIcIrP/rNMe7NGrlMAwkQMxBlKNmY5dxItRf5WIO4Z
         hqpQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795616527; x=1796221327; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qcxgI/Ns4WvtOt6H6UP0HsEplcfIU7aicu4QDdc3bw8=;
        b=aD244ynPhLQyhAY40kgz3SSCgVpHYZ+zc4+XDf/SZZ8T1JVfYUZITtjG4zQ3lLmu+c
         uXz+OfRkpHhGygfdXeIoshwahWUQDcdTf3QbAx1+t2DiHNmsCOvhHRCXvUAfvFafB1E1
         RkrP2zfOP7BZK7OBWJ2qnURZ0nDmMukNhxGCdrsclh5H05ysWQNsIoTubxNmLh3U6C85
         LsAFsRKouwoYZ+DK0En2lkZB+K/j1+jKDF6IJbSwq2+qpCxJQUXYkMWMOXySIBI4KQAw
         CdGTWaHPj6ZBjpRJm+zhCLuwbpjayZ50mX4pO3BTk+fgJYX69Myo3l70+I1L/VsWyBl6
         4oJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616527; x=1796221327;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qcxgI/Ns4WvtOt6H6UP0HsEplcfIU7aicu4QDdc3bw8=;
        b=HTCfbWaCjuGyR25yxfEjkQCaqRbJEvP64LKwXm34GDqt9Z4VFM3g7MjJrNb4xZ+tB0
         XqyPh7E7W2GCAP5aVWujR101Ua82aSz5clSCgi43yVjU6O1/E8J2iFr/VAaCAtPwQWnG
         0E/g2foDiJ7PoqSzDHFFpfW3sowFufHAAq7orhiQ0PniJvA3iYKXMlBv5St+4lIHh+/Q
         pn1jca5UKnD4Kpn2mQEpMq2NyNbLx4OGwSGTLUwj7Zdt6Zg+I4hyC0cWTD/aS6PZ/yV0
         Gpr/ANk+D4iQvfo04GkKDl+FMoxdioCh7pFvLzPfw8sYZ91Qga37699B+aI6IliKHzkx
         ZuLw==
X-Forwarded-Encrypted: i=1; AL+hErGg7mxhkYyp38sEYXaErt0qJ9+LbRUpqA86cTnmMBv+Q7mRrJV7sAMS2P2UlaUzu7ut/vpxRsG01PWd2w==@lists.infradead.org
X-Gm-Message-State: APuU4Z/Sz9m3I1gkOc80GjKzR1DS+9ySgdOiQkLs+knWNquM5RHt8cjP
	mPlYcwLw7QnvpPaVvLa4tabM8mdh3DQvg8v7B8QOah9Voa1/NyzhmafGiHPcHw2kPRLMDmMmCdM
	TxSVQMw9/B5Ni2BiGgpKd4YO0cCPXVlE=
X-Gm-Gg: AZFdTZd+inQMF6IXGKRP/ppYFYF/i+IA7k4Tnj/Fgr/vZrkiHDgz3QEE8LIuek7AKfb
	V5FmXes2AZjXuNBsMDf1DY/atTOperJuCoOSmShn3XdsGbtqvCK0XnSdvb31ChXrdoW/3JB1YoB
	Q4dVzTtelhOg8Th4gMhIZcMKtQdI8azBoEFzh8CY48rE7EmjrxlnzUKF/Ux2Vj+hQdfrbivG/gW
	lh8cXsFIHprGkCw9g3RudPSHGAsC0DsYMJ5jUHX7NNIWBkjy6BHBqm3qS5D5bFPy+suieTSn9Zu
	3A8NU9xo3DVahCegk8o7qv6+bqpfgiKJUXG3TfJzgJ1ctPDG0Si20G7iyoq5CkYYKGYBxWM6lVq
	tEx9WwlXzTJriW/MnT1CxoOk5+tFGWkRKDZ/x
X-Received: by 2002:a05:6402:1941:b0:6ba:7b46:78a7 with SMTP id
 4fb4d7f45d1cf-6ba7b468320mr9290374a12.35.1795616526919; Wed, 25 Nov 2026
 06:22:06 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261123-fix-bpf3-eeprom-v1-1-df8cce6ef2b5@gmail.com>
 <awS2-clBenE1r1a1@aurel32.net> <12933da0-9bc8-4f92-96d4-36c5673d3f5e@gmail.com>
 <awXUSuYOUQMPCl-5@aurel32.net> <CANAwSgRf0XpWnyDaoiGySFv3NPKCBYn6BODf1M+P4w58BF-duw@mail.gmail.com>
 <CAKyUbwUyYptzZrMFKD-RjmufU7Wni8-w5vQvPyxUgx9BU++vsw@mail.gmail.com>
In-Reply-To: <CAKyUbwUyYptzZrMFKD-RjmufU7Wni8-w5vQvPyxUgx9BU++vsw@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 25 Nov 2026 19:51:54 +0530
X-Gm-Features: Aa3M54o9-c3RGYDe5yPxK4MpGdTfrRnEWaETWf2MdzNo7lC6NrDNImRWSOSHHdE
Message-ID: <CANAwSgSNuEC72PM=1ai3xj31+=veLkDhAfuNJ3pmCggBtx9v-Q@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k1: fix the EEPROM page size
To: Zixian Zeng <sycamoremoon376@gmail.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	Junhui Liu <junhui.liu@pigmoral.tech>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_062212_101889_2DF293EA 
X-CRM114-Status: GOOD (  45.89  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgWml4aWFuLAoKT24gV2VkLCAyNSBOb3YgMjAyNiBhdCAxNTowOCwgWml4aWFuIFplbmcgPHN5
Y2Ftb3JlbW9vbjM3NkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgQW5hbmQsCj4KPiBPbiBXZWQs
IE5vdiAyNSwgMjAyNiBhdCAzOjUy4oCvUE0gQW5hbmQgTW9vbiA8bGludXguYW1vb25AZ21haWwu
Y29tPiB3cm90ZToKPiA+Cj4gPiBIaSBBdXJlbGllbiwKPiA+Cj4gPiBPbiBXZWQsIDI1IE5vdiAy
MDI2IGF0IDAwOjE0LCBBdXJlbGllbiBKYXJubyA8YXVyZWxpZW5AYXVyZWwzMi5uZXQ+IHdyb3Rl
Ogo+ID4gPgo+ID4gPiBIaSBaaXhpYW4sCj4gPiA+Cj4gPiA+IE9uIDIwMjYtMTEtMjQgMTE6MzEs
IFppeGlhbiBaZW5nIHdyb3RlOgo+ID4gPiA+IEhpIEF1cmVsaWVuLAo+ID4gPiA+Cj4gPiA+ID4g
T24gMjAyNi8xMS8yNCA1OjU4LCBBdXJlbGllbiBKYXJubyB3cm90ZToKPiA+ID4gPiA+IEhpLAo+
ID4gPiA+ID4KPiA+ID4gPiA+IE9uIDIwMjYtMTEtMjMgMTI6NDEsIFppeGlhbiBaZW5nIHdyb3Rl
Ogo+ID4gPiA+ID4gPiBUaGUgYmFuYW5hcGktZjMgY2FycmllcyBhbiBBVDI0QzAyIGNvbXBhdGli
bGUgRUVQUk9NIEdUMjRDMDJCIFsxXToKPiA+ID4gPiA+ID4gMjU2IGJ5dGVzIHdpdGggYW4gOC1i
eXRlIHdyaXRlIHBhZ2UsIHdoaWNoIGNhbiBiZSBmb3VuZCBpbiBzY2hlbWF0aWNbMl0uCj4gPiA+
ID4gPiA+IFRoZSBkZXZpY2UgdHJlZSBkZWNsYXJlcyBwYWdlc2l6ZSA9IDwxNj4sIHdoaWNoIGRv
ZXMgbm90IG1hdGNoIHRoZQo+ID4gPiA+ID4gPiBlZXByb20gY2hpcCBkYXRhc2hlZXQgd2hpY2gg
ZGVjbGFyZXMgcGFnZXNpemUgOCBieXRlcy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBPb3BzLCBJIGFt
IG5vdCBzdXJlIGhvdyBJIGdvdCB0aGF0IHdyb25nLiBTb3JyeSBhYm91dCB0aGF0Lgo+ID4gPgo+
ID4gPiBUaGUgcXVlc3Rpb24gb2YgdGhlIHBhZ2Ugc2l6ZSBoYXMgYmVlbiByYWlzZWQgaW4gdGhl
IGluaXRpYWwgcmV2aWV3IFsxXSwKPiA+ID4gYW5kIGl0IHNlZW1zIHRoYXQgdGhlIEdUMjRDMDIg
aGFzIGEgMTYtYnl0ZSBwYWdlIHNpemUsIHdoaWxlIHRoZQo+ID4gPiBHVDI0QzAyQiBbMl0gaGFz
IGEgOC1ieXRlIHBhZ2Ugc2l6ZS4gVGhlIEJQSS1GMyBzY2hlbWF0aWNzIGNvbmZpcm1zIHRoYXQK
PiA+ID4gdGhlIEIgdmVyc2lvbiBpcyB1c2VkLiBTb3JyeSBhYm91dCB0aGUgbWlzdGFrZS4KPiA+
ID4KPiA+ID4gPiA+ID4gRUVQUk9NIHBhZ2VzaXplIG9mIGsxLWJhbmFuYXBpLWNtNi1pb1szXSBh
bmQgazEtb3JhbmdlcGktcnYyWzRdIGNoYW5nZWQKPiA+ID4gPiA+ID4gdG9nZXRoZXIsIGJhc2Vk
IG9uIHRoZSBjaGlwIG1vZGVsIHNob3duIGluIHRoZSBzY2hlbWF0aWMgZGlhZ3JhbS4KPiA+ID4g
PiA+Cj4gPiA+ID4gPiBUaGUgazEtbWlsa3YtanVwaXRlciBib2FyZCBpcyBhbHNvIGFmZmVjdGVk
IHdpdGggdGhlIHNhbWUgaXNzdWUsIGRlc3BpdGUKPiA+ID4gPiA+IHVzaW5nIGEgc2xpZ2h0bHkg
ZGlmZmVyZW50IEVFUFJPTSAoMjRDMDQpLgo+ID4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IFRoZSBH
VDI0QzA0QSBFRVBST00gdXNlZCBvbiBrMS1taWxrdi1qdXBpdGVyIGJvYXJkIGRvZXNuJ3Qgc2Vl
bSB0byBoYXZlCj4gPiA+ID4gdGhlIHNhbWUgaXNzdWUsIHdoaWNoIHlvdSBjYW4gZmluZCAiUGFn
ZSBTaXplOiAxNiBieXRlcyIgaW4gZGF0YXNoZWV0Ogo+ID4gPiA+IGh0dHBzOi8vd3d3LmdpYW50
ZWMtc2VtaS5jb20vdXBsb2Fkcy8yMDIyMDkyOS9HVDI0QzA0QS5wZGYKPiA+ID4KPiA+ID4gSW5k
ZWVkIHlvdSBhcmUgY29ycmVjdCwgYW5kIEkgY29uZmlybSB0aGF0IHRoaXMgaXMgdGhlIGV4YWN0
IHZlcnNpb24KPiA+ID4gdXNlZCBvbiB0aGUgc2NoZW1hdGljcy4gVGhlcmVmb3JlIHRoZXJlIGlz
IG5vIG5lZWQgdG8gZXh0ZW5kIHlvdXIgcGF0Y2gsCj4gPiA+IGl0IGNhbiBiZSBtZXJnZWQgdGhh
dCB3YXkuCj4gPiA+Cj4gPiA+ID4gQnV0IEkgZG9uJ3QgaGF2ZSB0aGUgYm9hcmQsIHNpbXBsZSB0
ZXN0IHdvdWxkIGJlIGFwcHJlY2lhdGVkLiBQZXJoYXBzIEkKPiA+ID4gPiBzaG91bGQgaW5jbHVk
ZSB0ZXN0IHN0ZXBzIGluIHRoZSBjb21taXQgbWVzc2FnZSBmb3IgdGhlIG5leHQgcmV2aXNpb24u
Cj4gPiA+Cj4gPiA+IFVuZm9ydHVuYXRlbHkgdGhlIGJvYXJkIGhhcyB0aGUgRUVQUk9NIHdyaXRl
IHByb3RlY3Rpb24gcGluIGNvbm5lY3RlZCB0bwo+ID4gPiBWQ0MsIHdoaWNoIG1lYW5zIHRoZSB3
cml0ZSBwcm90ZWN0aW9uIGlzIGVuYWJsZWQuIFRoZXJlZm9yZSB0ZXN0aW5nIGlzCj4gPiA+IG5v
dCBzbyBlYXN5Lgo+ID4gPgo+ID4gPiBSZWdhcmRzCj4gPiA+IEF1cmVsaWVuCj4gPiA+Cj4gPiA+
IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi9hTkx6UkpjS0NZT25nYzd6
QGF1cmVsMzIubmV0Lwo+ID4gPiBbMl0gaHR0cHM6Ly93d3cuZ2lhbnRlYy1zZW1pLmNvbS9qdWNo
ZW4xMTIzL3VwbG9hZHMvcGRmL0dUMjRDMDJfRFNfQXUucGRmCj4gPiA+Cj4gPiBBcG9sb2dpZXMs
IHRoaXMgaXMgYSBkaWZmZXJlbnQgaXNzdWUuCj4gPgo+ID4gSSBhbSBjdXJyZW50bHkgd29ya2lu
ZyBvbiBlbmFibGluZyBtdWx0aS1EVEIgc3VwcG9ydCBpbiBVLUJvb3QgU1BMCj4gPiBmb3IgU3Bh
Y2VtaVQgSzEgYm9hcmRzLgo+ID4KPiA+IFdoaWxlIGludmVzdGlnYXRpbmcgdGhlIGJvYXJkIGRl
dGVjdGlvbiBpc3N1ZSwgSSBub3RpY2VkIHRoYXQgdGhlIEVFUFJPTQo+ID4gb24gbXkgQmFuYW5h
IFBpIEJQSS1GMyBkb2VzIG5vdCBjb250YWluIGEgUHJvZHVjdCBOYW1lIFRMViBlbnRyeS4KPiA+
Cj4gPiBhbGFybUBrMTp+JCBzdWRvIGhleGR1bXAgLUMgL3N5cy9idXMvaTJjL2RldmljZXMvMi0w
MDUwL2VlcHJvbQo+ID4gMDAwMDAwMDAgIDU0IDZjIDc2IDQ5IDZlIDY2IDZmIDAwICAwMSAwMCAy
MCAyNCAwNiBmZSBmZSBmZSAgfFRsdkluZm8uLi4gJC4uLi58Cj4gPiAwMDAwMDAxMCAgZDUgNTIg
YmQgMmEgMDIgMDAgMDIgMjMgIDBjIDM5IDM4IDYxIDM5IDYzIDMzIDYxICB8LlIuKi4uLiMuOThh
OWMzYXwKPiA+IDAwMDAwMDIwICAzMiA2MiA2NCAzNCAzNyBmZSAwNCAzYiAgZTMgZmYgYmQgZmYg
ZmYgZmYgZmYgZmYgIHwyYmQ0Ny4uOy4uLi4uLi4ufAo+ID4gMDAwMDAwMzAgIGZmIGZmIGZmIGZm
IGZmIGZmIGZmIGZmICBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiAgfC4uLi4uLi4uLi4uLi4uLi58
Cj4gPiAqCj4gPiAwMDAwMDEwMAo+ID4KPiA+IEFsdGhvdWdoIHRoZSBFRVBST00gaXMgcmVhZGFi
bGUsIHRoZSBtaXNzaW5nIFByb2R1Y3QgTmFtZSBUTFYgZW50cnkKPiA+IGV4cGxhaW5zIHdoeSBy
ZWFkX3Byb2R1Y3RfbmFtZSgpIHJldHVybnMgYC1FTk9FTlRgICgtMiksIGFzc3VtaW5nIHRoZQo+
ID4gRUVQUk9NIHJlYWQgYW5kIHZhbGlkYXRpb24gc3VjY2VlZC4KPiA+Cj4gPiBDb25zZXF1ZW50
bHksIGF1dG9tYXRpYyBib2FyZCBkZXRlY3Rpb24gZmFpbHMsIGFuZCBVLUJvb3QgZmFsbHMgYmFj
ayB0bwo+ID4gQ09ORklHX0RFRkFVTFRfREVWSUNFX1RSRUUsIHdoaWNoIG1heSBzZWxlY3QgYW4g
aW5jb3JyZWN0IGRldmljZQo+ID4gdHJlZSBmb3IgdGhlIHRhcmdldCBib2FyZC4KPgo+IFllcywg
ZXhhY3RseS4gSSBlbmNvdW50ZXJlZCB0aGUgc2FtZSBwcm9ibGVtLiBCb2FyZCBkZXRlY3QgZmFp
bGVkIGFuZCB0aGVuIHVzZWQKPiBkZWZhdWx0IGRldmljZSB0cmVlIChNdXNlUGkgUHJvKS4KPgo+
ID4gU2luY2UgdGhlIFNEIGNhcmQtZGV0ZWN0IEdQSU8gcG9sYXJpdHkgZGlmZmVycyBiZXR3ZWVu
IHRoZSBCYW5hbmEgUGkgQlBJLUYzCj4gPiBhbmQgTXVzZVBpIFBybywgc2VsZWN0aW5nIHRoZSBp
bmNvcnJlY3QgZGV2aWNlIHRyZWUgY2FuIHJlc3VsdCBpbiBTRAo+ID4gY2FyZCBkZXRlY3Rpb24K
PiA+IGFuZCBib290IGZhaWx1cmVzLgo+ID4KPiA+IFRoZSBmb2xsb3dpbmcgU1BMIGJvb3QgbG9n
IHNob3dzIHRoZSBib2FyZCBkZXRlY3Rpb24gZmFpbHVyZSwgYWx0aG91Z2gKPiA+IEREUiBpbml0
aWFsaXphdGlvbiBjb21wbGV0ZXMgc3VjY2Vzc2Z1bGx5Ogo+ID4KPiA+IGBgYAo+ID4gVS1Cb290
IFNQTCAyMDI2LjEwLTAxMDYwLWdmMzA4MGFiY2ZlOTItZGlydHkgKE9jdCAyNCAyMDI2IC0gMTc6
MzA6MDMgKzA1MzApCj4gPiBGYWlsIHRvIGRldGVjdCBib2FyZDotMgo+ID4gdmRkX2NvcmUsIHZh
bHVlOjkwMDAwMAo+ID4gdmRkXzF2OCwgdmFsdWU6MTgwMDAwMAo+ID4gdmRkXzF2OF9tbWMsIHZh
bHVlOjE4MDAwMDAKPiA+IEREUiBmaXJtd2FyZTogWzB4YzA4MjA5MDBdOjB4ZjAyMjcxNzksIHNp
emU6MHg4ZDk4Cj4gPiBERFIgaXMgcmVhZHkKPiA+IGBgYAo+ID4gQ291bGQgeW91IHBsZWFzZSBj
b25maXJtIHdoZXRoZXIgdGhlIFByb2R1Y3QgTmFtZSBUTFYgZW50cnkgaXMKPiA+IGV4cGVjdGVk
IHRvIGJlIHByb2dyYW1tZWQgaW50byB0aGUgRUVQUk9NIGR1cmluZyBtYW51ZmFjdHVyaW5nPwo+
Cj4gWWVzLCBObyBwcm9kdWN0IG5hbWUgVExWIGVudHJ5IGluIG15IEJhbmFuYXBpLWYzIEVFUFJP
TS4gVGhhdCdzIHRoZSByZWFzb24KPiBJIHdhbnRlZCB0byB3cml0ZSBFRVBST00gYW5kIGZvdW5k
IHRoaXMgRUVQUk9NIHBhZ2VzaXplIGlzc3VlLgo+Cj4gPiBBbHNvLCBpcyB0aGVyZSBhIHJlY29t
bWVuZGVkIGFwcHJvYWNoIGZvciBoYW5kbGluZyBib2FyZHMgd2l0aCBtaXNzaW5nCj4gPiBwcm9k
dWN0IGluZm9ybWF0aW9uIGluIHRoZSBFRVBST00gdG8gZW5zdXJlIHJlbGlhYmxlIGF1dG9tYXRp
YyBkZXZpY2UKPiA+IHRyZWUgc2VsZWN0aW9uPwo+Cj4gSSdtIG5vdCBzdXJlLiBDdXJyZW50bHks
IGFmdGVyIEkgY29ycmVjdGVkIHBhZ2VzaXplLCBJIHdyb3RlIEVFUFJPTSBtYW51YWxseToKPiBg
YGAKPiBVLUJvb3QgU1BMIDIwMjcuMDEtcmMyLTAwMDM5LWc0Y2ZmNTBmNDAzNDMKPiBHZXQgYm9h
cmQgbmFtZTprMS14X2RlYjEKPiB2ZGRfY29yZSwgdmFsdWU6OTAwMDAwCj4gdmRkXzF2OCwgdmFs
dWU6MTgwMDAwMAo+IEREUiBmaXJtd2FyZTogWzB4YzA4MWRmODBdOjB4ZjAyMjcxNzksIHNpemU6
MHg4ZDk4Cj4gRERSIGlzIHJlYWR5Cj4gTm8gU1BJIGNvbnRyb2xsZXIgKC0xOSkKPiBUcnlpbmcg
dG8gYm9vdCBmcm9tIE1NQzIKPiAuLi4uCj4gPT4gdGx2X2VlcHJvbQo+IFRMVjogMAo+IFRsdklu
Zm8gSGVhZGVyOgo+ICAgIElkIFN0cmluZzogICAgVGx2SW5mbwo+ICAgIFZlcnNpb246ICAgICAg
MQo+ICAgIFRvdGFsIExlbmd0aDogMjkKPiBUTFYgTmFtZSAgICAgICAgICAgICBDb2RlIExlbiBW
YWx1ZQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tIC0tLS0gLS0tIC0tLS0tCj4gQmFzZSBNQUMgQWRk
cmVzcyAgICAgMHgyNCAgIDYgRkU6RkU6RkU6OTA6MUU6RjAKPiBQcm9kdWN0IE5hbWUgICAgICAg
ICAweDIxICAgOSBrMS14X2RlYjEKPiBNQUMgQWRkcmVzc2VzICAgICAgICAweDJBICAgMiAyCj4g
Q1JDLTMyICAgICAgICAgICAgICAgMHhGRSAgIDQgMHhBODhDOTNGMAo+IGBgYAo+IE1heWJlIHdl
IGNhbiBkaXNjdXNzIHRoaXMgaW4gdS1ib290IG1haWxsaW5nIGxpc3Q/IFRoaXMgaXMgaW5kZWVk
IGEKPiBzZXBhcmF0ZSBpc3N1ZS4KQ29ycmVjdCwgSSB3aWxsIHJhaXNlIHRoaXMgaXNzdWUgb3Zl
ciB0aGVyZS4KClJldmlld2VkLWJ5OiBBbmFuZCBNb29uIDxsaW51eC5hbW9vbkBnbWFpbC5jb20+
ClRlc3RlZC1ieTogQW5hbmQgTW9vbiA8bGludXguYW1vb25AZ21haWwuY29tPgoKQ2FuIHlvdSBm
b2xsb3cgdXAgd2l0aCB0aGUgcGF0Y2ggdG8gcmVhZCB0aGUgTUFDIGFkZHJlc3MgZnJvbSB0aGUg
RUVQUk9NLgoKJCBnaXQgZGlmZiAuCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3Nw
YWNlbWl0L2sxLWJhbmFuYXBpLWYzLmR0cwpiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQv
azEtYmFuYW5hcGktZjMuZHRzCmluZGV4IDFkYjg5NjUzNjI1Ni4uMzkyOGE0N2I3NzAyIDEwMDY0
NAotLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLWJhbmFuYXBpLWYzLmR0cwor
KysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLWJhbmFuYXBpLWYzLmR0cwpAQCAt
MTM3LDYgKzEzNyw4IEBAICZldGgwIHsKICAgICAgICBwaW5jdHJsLTAgPSA8JmdtYWMwX2NmZz4s
IDwmZ21hYzBfY2xrX3JlZl9jZmc+OwogICAgICAgIHJ4LWludGVybmFsLWRlbGF5LXBzID0gPDA+
OwogICAgICAgIHR4LWludGVybmFsLWRlbGF5LXBzID0gPDA+OworICAgICAgIG52bWVtLWNlbGxz
ID0gPCZtYWNfYWRkcmVzcyAwPjsKKyAgICAgICBudm1lbS1jZWxsLW5hbWVzID0gIm1hYy1hZGRy
ZXNzIjsKICAgICAgICBzdGF0dXMgPSAib2theSI7CgogICAgICAgIG1kaW8tYnVzIHsKQEAgLTE2
MCw2ICsxNjIsOCBAQCAmZXRoMSB7CiAgICAgICAgcGluY3RybC0wID0gPCZnbWFjMV9jZmc+LCA8
JmdtYWMxX2Nsa19yZWZfY2ZnPjsKICAgICAgICByeC1pbnRlcm5hbC1kZWxheS1wcyA9IDwwPjsK
ICAgICAgICB0eC1pbnRlcm5hbC1kZWxheS1wcyA9IDwyNTA+OworICAgICAgIG52bWVtLWNlbGxz
ID0gPCZtYWNfYWRkcmVzcyAxPjsKKyAgICAgICBudm1lbS1jZWxsLW5hbWVzID0gIm1hYy1hZGRy
ZXNzIjsKICAgICAgICBzdGF0dXMgPSAib2theSI7CgogICAgICAgIG1kaW8tYnVzIHsKQEAgLTIw
Miw3ICsyMDYsNyBAQCBlZXByb21ANTAgewogICAgICAgICAgICAgICAgbnZtZW0tbGF5b3V0IHsK
ICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJvbmllLHRsdi1sYXlvdXQiOwoK
LSAgICAgICAgICAgICAgICAgICAgICAgbWFjLWFkZHJlc3MgeworICAgICAgICAgICAgICAgICAg
ICAgICBtYWNfYWRkcmVzczogbWFjLWFkZHJlc3MgewogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICNudm1lbS1jZWxsLWNlbGxzID0gPDE+OwogICAgICAgICAgICAgICAgICAgICAgICB9
OwoKCj4KPiBCZXN0IHJlZ2FyZHMsCj4gWml4aWFuCgpUaGFua3MKLUFuYW5kCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
