Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241FFC6FD1F
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Mar 2024 02:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5tEnBWB7nk45q9CVR4dMAO8/gfVFbpCZpsnmu1m+Kkg=; b=VTl1a43HHXagAy
	gn5tXRwUD2LMxYwXMeEXntpgE4FYEek4ZumVAO1Sjl/W4BhttRxxQwp3tm8hZWpRqQkqRT9NnJJb+
	7P2pvfdWnZcLLXTIKVUg2IHCeuMgYyBbVQpf7lunlEIITKhIRNVSwlVr6IPqZumt5yNgO4O4SqCEC
	+3Pyyz/Sy7jREl9ie22CHbjD73JW7iAjpcQsqOn6hAf2NDqGsQ0YpzQy+7AzQlNxtd+O4hVNJCNJh
	1JbWlR3YNoZTpv1lOcM6PHuVj/q3toggLBQzdYFNMqm/lN2ePvYC3pfywgZoLc/ywaixTmwbJAD2N
	vJaojAhi1eUwRAJ1iUZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rql25-00000004dRi-21KJ;
	Sun, 31 Mar 2024 02:34:53 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rql1z-00000004dQL-3haz;
	Sun, 31 Mar 2024 02:34:49 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-7d0486cf91aso150764739f.1;
        Sat, 30 Mar 2024 19:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711852485; x=1712457285; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gV26OU7eK1E3sOOfCTy+tBkXi+05uIIvVJ+TP4hGj4w=;
        b=E7NMVFAVU+7s/hGSncbeSOmGGbAgCxXcaRQHk6QIVtkG8zdP+gGJPHbjXfzPeu6Xmp
         +JRUUttXQaF4dFAHGon7xoeYo8BS9k+LYJHtodqZr/fOK17tIlCg5F9gAdYrB8yZckeJ
         Xz+lxUMXJA0YYvmPzAWaqMoQ5/9CAHnPJwRQ9f23J8cFbZlqmlbgS1eCTEhVWLSPcfxm
         avTkeqEUVysPtL7e8goujSnBUDhHbmeAnmz0LIQbgEcO5H7BCsHNzpWjQiPW/1/yva+I
         1smEwktQdXFlkddSEnN86AZpJ4OZdzU2qoY4E1UAcHg7W+njvDmp5PH+hRR+NMrnMcRH
         WZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711852485; x=1712457285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gV26OU7eK1E3sOOfCTy+tBkXi+05uIIvVJ+TP4hGj4w=;
        b=KFCx7IcsVejCrQgRsN8nkVaVejgtqZXTLAlsq0e29xiHmSlMhEER5VBqn9FTSvKwa2
         L+5owVOXQYh600Icu4rypc3kg3zv2MWV3KRQT1tUoHVk1XeOsQ1bj3S2p/Y0hLb1LCci
         Qa23tHQ/UPFyI3w6i4E3/9ObiSfjweU+kybb/jJz5yGsH+3/e3ZWemUfysV/EujvdIyX
         rXddFtCRJluaHPqvmprycUnaw08gOKOZcTyb3nRP7EX0x2H6457oXhPbYZzArNZ25a8S
         Q+rO0kP30KHd1/a6AC7MtJ0Knu9rDHRKXL9cnJPGqg2MW6iIrNrHQcbu0OuO8cdNVPEb
         z6zA==
X-Forwarded-Encrypted: i=1; AJvYcCWzaz4G3qZrfe5Gyzt/OTHLaRJ01xYgwT4bZTiM5ZGuGuiINWSWinJCrVQJr5DOWqxn4J7nDaIBAoyi/WwXaPzrS0evXh5zMdgpXa2sc+iWkthCnv8dJJbTOc8x4e/k3S3y5R013XKn8MSIbbFUPBsJKl9pI6Q=
X-Gm-Message-State: AOJu0Yyp37hRxJnvHoY40U75PoIa0EqlEB1L1bzHZWdg7VdP292K+etO
	OUynrs37FT2+PrvE+epAhOmofzI3VltHKEKUdu1o6ITp4gw9Zeg+9/SIJRsVFLHqVR6zYjGaQj2
	1qsKJ6bobfy1tasjwfVIZaM3MWT0=
X-Google-Smtp-Source: AGHT+IEUljvEWt6RLJvm0ZvDNAAvbKF98d8W07FBneubUp0ru50ICaCtTHNp6cmd+wxEi3ZRk7j/LT8mS1rRQW2OsKc=
X-Received: by 2002:a05:6e02:3710:b0:366:ab6f:f63 with SMTP id
 ck16-20020a056e02371000b00366ab6f0f63mr8646788ilb.3.1711852485494; Sat, 30
 Mar 2024 19:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAADnVQJ_ZCzMmT1aBsNXEBFfYNSVBdBXmLocjR0PPEWtYQrQFw@mail.gmail.com>
 <CALz3k9icPePb0c4FE67q=u1U0hrePorN9gDpQrKTR_sXbLMfDA@mail.gmail.com>
 <CAADnVQLwgw8bQ7OHBbqLhcPJ2QpxiGw3fkMFur+2cjZpM_78oA@mail.gmail.com>
 <CALz3k9g9k7fEwdTZVLhrmGoXp8CE47Q+83r-AZDXrzzuR+CjVA@mail.gmail.com>
 <CAADnVQLHpi3J6cBJ0QBgCQ2aY6fWGnVvNGdfi3W-jmoa9d1eVQ@mail.gmail.com>
 <CALz3k9g-U8ih=ycJPRbyU9x_9cp00fNkU3PGQ6jP0WJ+=uKmqQ@mail.gmail.com>
 <CALz3k9jG5Jrqw=BGjt05yMkEF-1u909GbBYrV-02W0dQtm6KQQ@mail.gmail.com>
 <20240328111330.194dcbe5@gandalf.local.home> <CAEf4BzYgzOti+Hfdn3SUCjuofGedXRSGApVDD+K2TdG6oNE-pw@mail.gmail.com>
 <20240330082755.1cbeb8c6@rorschach.local.home> <ZghRXtc8ZiTOKMR3@krava>
In-Reply-To: <ZghRXtc8ZiTOKMR3@krava>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Sat, 30 Mar 2024 19:34:33 -0700
Message-ID: <CAEf4BzbOAwLZ9=QnMQo-W5oHxTA7nM5ERRp0Q=WihuC8b+Y1Ww@mail.gmail.com>
Subject: Re: [External] Re: [PATCH bpf-next v2 1/9] bpf: tracing: add support
 to record and check the accessed args
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>, 
	Alexei Starovoitov <alexei.starovoitov@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eddy Z <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	X86 ML <x86@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Quentin Monnet <quentin@isovalent.com>, bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, linux-trace-kernel@vger.kernel.org, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240330_193447_952560_A263B684 
X-CRM114-Status: GOOD (  16.51  )
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

T24gU2F0LCBNYXIgMzAsIDIwMjQgYXQgMTA6NTLigK9BTSBKaXJpIE9sc2EgPG9sc2FqaXJpQGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBTYXQsIE1hciAzMCwgMjAyNCBhdCAwODoyNzo1NUFNIC0w
NDAwLCBTdGV2ZW4gUm9zdGVkdCB3cm90ZToKPiA+IE9uIEZyaSwgMjkgTWFyIDIwMjQgMTY6Mjg6
MzMgLTA3MDAKPiA+IEFuZHJpaSBOYWtyeWlrbyA8YW5kcmlpLm5ha3J5aWtvQGdtYWlsLmNvbT4g
d3JvdGU6Cj4gPgo+ID4gPiBJIHRob3VnaHQgSSdsbCBqdXN0IGFzayBpbnN0ZWFkIG9mIGRpZ2dp
bmcgdGhyb3VnaCBjb2RlLCBzb3JyeSBmb3IKPiA+ID4gYmVpbmcgbGF6eSA6KSBJcyB0aGVyZSBh
bnkgd2F5IHRvIHBhc3MgcHRfcmVncy9mdHJhY2VfcmVncyBjYXB0dXJlZAo+ID4gPiBiZWZvcmUg
ZnVuY3Rpb24gZXhlY3V0aW9uIHRvIGEgcmV0dXJuIHByb2JlIChmZXhpdC9rcmV0cHJvYmUpPyBJ
LmUuLAo+ID4gPiBob3cgaGFyZCBpcyBpdCB0byBwYXNzIGlucHV0IGZ1bmN0aW9uIGFyZ3VtZW50
cyB0byBhIGtyZXRwcm9iZT8gVGhhdCdzCj4gPiA+IHRoZSBiaWdnZXN0IGFkdmFudGFnZSBvZiBm
ZXhpdCBvdmVyIGtyZXRwcm9iZSwgYW5kIGlmIHdlIGNhbiBtYWtlCj4gPiA+IHRoZXNlIG9yaWdp
bmFsIHB0X3JlZ3MvZnRyYWNlX3JlZ3MgYXZhaWxhYmxlIHRvIGtyZXRwcm9iZSwgdGhlbgo+ID4g
PiBtdWx0aS1rcmV0cHJvYmUgd2lsbCBlZmZlY3RpdmVseSBiZSB0aGlzIG11bHRpLWZleGl0Lgo+
ID4KPiA+IFRoaXMgc2hvdWxkIGJlIHBvc3NpYmxlIHdpdGggdGhlIHVwZGF0ZXMgdGhhdCBNYXNh
bWkgaXMgZG9pbmcgd2l0aCB0aGUKPiA+IGZncmFwaCBjb2RlLgo+Cj4geWVzLCBJIGhhdmUgYnBm
IGtwcm9iZS1tdWx0aSBsaW5rIHN1cHBvcnQgZm9yIHRoYXQgWzBdIChpdCdzIG9uIHRvcCBvZgo+
IE1hc2FtaSdzIGZwcm9iZS1vdmVyLWZncmFwaCBjaGFuZ2VzKSB3ZSBkaXNjdXNzZWQgdGhhdCBp
biBbMV0KClNvcnJ5LCBJIGZvcmdvdCB0aGUgcmVncy9hcmdzIHBhcnQsIG1vc3RseSByZW1lbWJl
cmluZyB3ZSBkaXNjdXNzZWQKc2Vzc2lvbiBjb29raWUgaWRlYXMuIFRoYW5rcyBmb3IgcmVtaW5k
ZXIhCgo+Cj4gamlya2EKPgo+IFswXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC9qb2xzYS9wZXJmLmdpdC9sb2cvP2g9YnBmL3Nlc3Npb25fZGF0YQo+IFsx
XSBodHRwczovL2xvcmUua2VybmVsLm9yZy9icGYvMjAyNDAyMjgwOTAyNDIuNDA0MDIxMC0xLWpv
bHNhQGtlcm5lbC5vcmcvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
