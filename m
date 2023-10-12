Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E4CCDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 16:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n2leg1TDZ0I0vIWmo954ixoXdIo3hVYXRgfywGjrf1E=; b=ukLcWZAqp+7gwS
	H1yCY2z1HxYNafd1aCBBGcAWR/zJQFOjdY/+BfTRy+oJQ4//iK6ddvHqKpsyeXJ4o6iR3X2P4yYJp
	fAbAbdYP/k4+CLHoRWBUmqcmGbUwQ9xmLuYPYolAEc8HfLtOvOgMAJFfauo+29UhCzAZsZGi5zzpo
	NUGXr5301EpQ/Vvoa99SaNO3y5FLSuUXMQL4hbw3K7W5w2oG9nhSDEXubC+UjXSJ8HZVvHP/Z/RHi
	OVvNe3RzaunafAc70gETJ9Ovb1z9MCyKiFj6TQtpDMhqTRIFejkqWoK1bDMWRpboss1i1yVWKW18w
	vyBRRN0pzITVvjGeQtjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqyY3-001PlD-1s;
	Thu, 12 Oct 2023 16:28:31 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqyY0-001Pjt-1H
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 16:28:30 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5044dd5b561so1535938e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Oct 2023 09:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697128101; x=1697732901; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvPFzv/vQzpigDF/RrVmKSWAiTfxGgVgBVZV9bvyAdM=;
        b=Ob0EaZQSPOIIMI976ZDMtkiiPcgXZEdvMpTrUx0EVUxZRisJB/THpz2bvEOtDCW7cL
         1ptBDTvJydLd7dVQr2wpszsDZwdpLJK3AjDrj/j3Q8ah+ArXLPP6mRQ7TIqvTw8JaGsn
         Z1EvhAtDVfoiqe5qFjnjfni4AyI7UvXCBGHkTY46ZGH2HpUOX9ZE/FNcN5XS+HHAH5yA
         sAbGLFEQlez4fuhbf4HhRNzBU1qlN4zKvADMxlUzzIeGSJOwrc7VOD1BfEmA6Yv/GnYI
         z48wTcoV4zNIL0rXm/L3B2WXnJjmUJsXz3x9MEDr7r8x/tSgN4IF2NZ2VDoE2GQOZbum
         TYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697128101; x=1697732901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvPFzv/vQzpigDF/RrVmKSWAiTfxGgVgBVZV9bvyAdM=;
        b=ErOuT407OyoO9H7urVuP7s5HBSQ4hJgwyNd2I/cI+7+Ut7JQEZnfyzwJ9dCUuSbfuR
         YztNJDH1PSJjDdVAiyoiBYWKY0dTFMCPCVG6kfM1CGpvxGnSPSsMbdS94WiSgALGYYMh
         anfgloM6A643RGn7YW6ZW7GAwmaH8oTAsdVswR05WmKFQEGdLRRb5yHCvLIHrmFPvl6W
         GZhR0aiPuoCOnewjgApm1woOjMuuATyo65EiBxJVQMkhX8sxL9RwgPQ3dwm4j0HLzbZz
         x3D/HC2e/5KWpl3bKjXhAM3s2yFK6TivD4wfBVyuocJCsrGGcYG15u6KcMhjtgFSE3EJ
         K5rw==
X-Gm-Message-State: AOJu0YyNnlE0CSIpBRKR3rAu1u0kTFk0tbAsN7v7Ev0My0PNK58o/JMi
	3ttOqUS72oL2UF6q7e0eGdu7GqyIBqerNx4hy1M3iw==
X-Google-Smtp-Source: AGHT+IHn/9WKVUA3hbamQusopdG6YKmUJRdUn5iLBH5qF/lV7QZb90d9hEZv/T0r8aZTXUFepJAIrRuQFMSetp5IOM4=
X-Received: by 2002:a05:6512:3d87:b0:504:7bb0:9d7e with SMTP id
 k7-20020a0565123d8700b005047bb09d7emr26151997lfv.27.1697128101616; Thu, 12
 Oct 2023 09:28:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230712084134.1648008-1-sameo@rivosinc.com> <20230712084134.1648008-2-sameo@rivosinc.com>
 <20230712-bulldozer-affected-199042dc3afd@wendy> <CALs-HsuxxVcwX=mSwktPiEiAFkfK+5qJ6zg1Bzf2t37L=pZWjw@mail.gmail.com>
 <20230713-3f574332a06678f908cee21e@orel> <20230713-aggregate-uncut-e16ee9270b14@wendy>
In-Reply-To: <20230713-aggregate-uncut-e16ee9270b14@wendy>
From: Evan Green <evan@rivosinc.com>
Date: Thu, 12 Oct 2023 09:27:45 -0700
Message-ID: <CALs-Hss0aAa_3dVUcdKN0i0+1F6iZ_d_95K2SwWw-B0MYbEXeQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] RISC-V: Add Bitmanip/Scalar Crypto parsing from DT
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, Samuel Ortiz <sameo@rivosinc.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	"Hongren (Zenithal) Zheng" <i@zenithal.me>, linux@rivosinc.com, 
	Heiko Stuebner <heiko.stuebner@vrull.eu>, Anup Patel <apatel@ventanamicro.com>, 
	linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, 
	Atish Patra <atishp@rivosinc.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	devicetree@vger.kernel.org, sorear@fastmail.com, 
	Jiatai He <jiatai2021@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_092828_442658_8BA00E56 
X-CRM114-Status: GOOD (  40.08  )
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

T24gVGh1LCBKdWwgMTMsIDIwMjMgYXQgNDoyOOKAr0FNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBKdWwgMTMsIDIwMjMgYXQgMTA6
NDY6MTRBTSArMDIwMCwgQW5kcmV3IEpvbmVzIHdyb3RlOgo+ID4gT24gV2VkLCBKdWwgMTIsIDIw
MjMgYXQgMTA6NDM6MzNBTSAtMDcwMCwgRXZhbiBHcmVlbiB3cm90ZToKPiA+ID4gT24gV2VkLCBK
dWwgMTIsIDIwMjMgYXQgMzozOeKAr0FNIENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3Jv
Y2hpcC5jb20+IHdyb3RlOgo+ID4gPiA+IE9uIFdlZCwgSnVsIDEyLCAyMDIzIGF0IDEwOjQxOjE3
QU0gKzAyMDAsIFNhbXVlbCBPcnRpeiB3cm90ZToKPiA+ID4gPiA+IEZyb206ICJIb25ncmVuICha
ZW5pdGhhbCkgWmhlbmciIDxpQHplbml0aGFsLm1lPgo+ID4gPiA+ID4KPiA+ID4gPiA+IFBhcnNl
IFpiL1prIHJlbGF0ZWQgc3RyaW5nIGZyb20gRFQgYW5kIG91dHB1dCB0aGVtIHRvIGNwdWluZm8u
Cj4gPiA+ID4KPiA+ID4gPiBPbmUgdGhpbmcgdGhhdCBoYXMgc3BydW5nIHRvIG1pbmQgaXMgdGhh
dCB0aGlzIGlzIG5vdCBsaW1pdGVkIHRvIERUCj4gPiA+ID4gYW55bW9yZSwgc2luY2UgdGhlIGlu
Zm9ybWF0aW9uIGNvdWxkIGluIHRoZW9yeSBjb21lIGZyb20gQUNQSSB0b28uCj4gPiA+ID4gRGl0
dG8gdGhlIHRpdGxlIEkgZ3Vlc3MuCj4gPiA+ID4KPiA+ID4gPiA+IEl0IGlzIHdvcnRoIG5vdGlu
ZyB0aGF0IHRoZSBTY2FsYXIgQ3J5cHRvIGV4dGVuc2lvbiBkZWZpbmVzICJ6ayIgYXMgYQo+ID4g
PiA+ID4gc2hvcnRoYW5kIGZvciB0aGUgWmtuLCBaa3IgYW5kIFprdCBleHRlbnNpb25zLiBTaW5j
ZSB0aGUgWmtuIG9uZSBhbHNvCj4gPiA+ID4gPiBpbXBsaWVzIHRoZSBaYmtiLCBaYmtjIGFuZCBa
Ymt4IGV4dGVuc2lvbnMsIHNpbXBseSBwYXNzaW5nIHRoZSB2YWxpZAo+ID4gPiA+ID4gInprIiBl
eHRlbnNpb24gbmFtZSB0aHJvdWdoIGEgRFQgd2lsbCBlbmFibGUgYWxsIG9mIHRoZSAgWmJrYiwg
WmJrYywKPiA+ID4gPiA+IFpia3gsIFprbiwgWmtyIGFuZCBaa3QgZXh0ZW5zaW9ucy4KPiA+ID4g
PiA+Cj4gPiA+ID4gPiBBbHNvLCBzaW5jZSB0aGVyZSBjdXJyZW50bHkgaXMgbm8gbWVjaGFuaXNt
IHRvIG1lcmdlIGFsbCBlbmFibGVkCj4gPiA+ID4gPiBleHRlbnNpb25zLCB0aGUgZ2VuZXJhdGVk
IGNwdWluZm8gb3V0cHV0IGNvdWxkIGJlIHJlbGF0aXZlbHkgbGFyZ2UuCj4gPiA+ID4gPiBGb3Ig
ZXhhbXBsZSwgc2V0dGluZyB0aGUgInJpc2N2LGlzYSIgRFQgcHJvcGVydHkgdG8gInJ2NjRpbWFm
ZGNfemtfemtzIgo+ID4gPiA+ID4gd2lsbCBnZW5lcmF0ZSB0aGUgZm9sbG93aW5nIGNwdWluZm8g
b3V0cHV0Ogo+ID4gPiA+ID4gInJ2NjRpbWFmZGNfemJrYl96YmtjX3pia3hfemtuZF96a25lX3pr
bmhfemtyX3prc2VkX3prc2hfemt0Ii4KPiA+ID4gPgo+ID4gPiA+IE9uIHRoYXQgbm90ZSwgSSd2
ZSBjcmVhdGVkIGFub3RoZXIgdmVyc2lvbiBvZiB3aGF0IGNoZWNraW5nIGZvcgo+ID4gPiA+IHN1
cGVyc2V0cyBjb3VsZCBsb29rIGxpa2UsIHNpbmNlIGl0J2xsIGJlIG5lZWRlZCBlaXRoZXIgYnkg
bXkgc2VyaWVzIG9yCj4gPiA+ID4gdGhpcyBvbmUsIGRlcGVuZGluZyBvbiB3aGF0IGdldHMgbWVy
Z2VkIGZpcnN0LiBJJ3ZlIHlldCB0byB0ZXN0IHRoZQo+ID4gPiA+IGRlZGljYXRlZCBleHRlbnNp
b25zIHBhcnQgb2YgaXQsIGJ1dCBJIHdhbnRlZCB0byBnZXQgdGhpcyBvdXQgYmVmb3JlIEkKPiA+
ID4gPiB3ZW50IGxvb2tpbmcgYXQgb3RoZXIgZml4ZXMgaW4gdGhlIGFyZWEuCj4gPiA+ID4KPiA+
ID4gPiBFdmFuLCBzaW5jZSBpdCB3YXMgeW91IHRoYXQgY29tbWVudGVkIG9uIHRoaXMgc3R1ZmYg
bGFzdCB0aW1lIGFyb3VuZCwKPiA+ID4gPiBjb3VsZCB5b3UgdGFrZSBhbm90aGVyIGxvb2s/IEkn
bSBzdGlsbCBub3Qga2VlbiBvbiB0aGUgInN1YnNldF9vZiIKPiA+ID4gPiBhcnJheXMsIGJ1dCB0
aGV5J3JlIGFuIGltcHJvdmVtZW50IG9uIHdoYXQgSSBoYWQgbGFzdCB0aW1lIGFyb3VuZCBmb3IK
PiA+ID4gPiBzdXJlLgo+ID4gPiA+Cj4gPiA+Cj4gPiA+IFRoaXMgbG9va3MgYWxyaWdodCB0byBt
ZS4gQXQgdGhlIHJpc2sgb2YgZ2V0dGluZyBpbnRvIGJpa2VzaGVkZGluZwo+ID4gPiB0ZXJyaXRv
cnksIHRoZSBvbmx5IGF3a3dhcmQgYml0IG9mIGl0IGlzIGl0IGNvbXBvc2VzIHRoZSBleHRlbnNp
b25zIGluCj4gPiA+IHNvcnQgb2YgdGhlIG9wcG9zaXRlIHdheSB5b3UnZCBleHBlY3QuIEkgdGVu
ZCB0byB0aGluayBvZiBaa3MgYXMgYmVpbmcKPiA+ID4gY29tcHJpc2VkIG9mIHt6YmtiLCB6Ymtj
LCB6a3NlZCwgemtzaH0sCj4gPgo+ID4gVGhpcyBpcyBhbHNvIHRoZSB3YXkgSSB0aGluayBvZiBp
dCwgc28sIEZXSVcsIEkgcHJlZmVyIHRoZSBhcHByb2FjaCBiZWxvdywKPiA+IHdoZXJlIGJ1bmRs
ZXMgYXJlIGV4cGFuZGVkLgo+Cj4gSSB0b29rIHRoZSBwYXRjaCBFdmFuIHNlbnQgbWUgb2ZmLWxp
c3QgJiBoYXZlIHNwdW4gaXQgaW50byBhICJyZWFsIgo+IHBhdGNoLiBJIGRpZCBzb21lIG1pbm9y
IGNoYW5nZXMgKGM5OSBsb29wLCBfX2luaXQgbWFya2luZykgdG8gbWF0Y2ggd2hhdAo+IHRoZSBj
b2RlIHdhcyBhbHJlYWR5IGRvaW5nIGFuZCBleHBhbmRlZCBpdCB0byB3b3JrIGZvciB0aGUgbmV3
IHByb3BlcnR5Cj4gc3R1ZmYuCj4gSSdtIG5vdCBzdXJlIHRoYXQgbWF0Y2hfaXNhX2V4dCgpIG5l
ZWRzIHRvIGJlIGEgZnVuY3Rpb24sIGdpdmVuIHRoZQo+IHNpbmdsZSB1c2VyIC0gaXQgbWlnaHQg
YmUgYmV0dGVyIHJlZmFjdG9yZWQgdG8gZHJvcCB0aGUgb3V0ZXIgaWYgJiByZXR1cm4KPiB3aGV0
aGVyIGEgbWF0Y2ggd2FzIGZvdW5kLgo+IElmIGRvbmUgdGhhdCB3b3VsZCBhbGxvdyBzaGFyaW5n
IHRoZSBzYW1lIGZ1bmN0aW9uIGJldHdlZW4gaXNhIHN0cmluZyBhbmQKPiBkZWRpY2F0ZWQgcHJv
cGVydHkgcGFyc2luZy4gSSBsZWZ0IGl0IGludGFjdCBmb3Igbm93LiBNaWdodCBhbHNvIGJlCj4g
d29ydGggYWRkaW5nIGtlcm5lbGRvYyBmb3IgdGhhdCBzdHJ1Y3QuCj4KPiAtLSA+OCAtLQo+IEZy
b20gODMwMGI5OGU0ODdlNTdkMTkyYmM5NTgxYzZhMzYzOWM0MGM1MjYyMyBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKPiBGcm9tOiBFdmFuIEdyZWVuIDxldmFuQHJpdm9zaW5jLmNvbT4KPiBEYXRl
OiBXZWQsIDEyIEp1bCAyMDIzIDEwOjM2OjE1IC0wNzAwCj4gU3ViamVjdDogW1BBVENIXSBSSVND
LVY6IEFkZCBzdXBwb3J0IFNjYWxhciBDcnlwdG8gdXNpbmcgImJ1bmRsZWQgZXh0ZW5zaW9ucyIK
Pgo+IFRoZSBTY2FsYXIgQ3J5cHRvIHNwZWNpZmljYXRpb24gZGVmaW5lcyBaayBhcyBhIHNob3J0
aGFuZCBmb3IgdGhlCj4gWmtuLCBaa3IgYW5kIFprdCBleHRlbnNpb25zLiBUaGUgc2FtZSBmb2xs
b3dzIGZvciBib3RoIFprbiwgWmtzIGFuZCBaYmssCj4gd2hpY2ggYXJlIGFsbCBzaG9ydGhhbmRz
IGZvciB2YXJpb3VzIG90aGVyIGV4dGVuc2lvbnMuIFRoZSBkZXRhaWxlZAo+IGJyZWFrZG93biBj
YW4gYmUgZm91bmQgaW4gdGhlaXIgZHQtYmluZGluZyBlbnRyaWVzLgo+Cj4gU2luY2UgWmtuIGFs
c28gaW1wbGllcyB0aGUgWmJrYiwgWmJrYyBhbmQgWmJreCBleHRlbnNpb25zLCBzaW1wbHkgcGFz
c2luZwo+ICJ6ayIgdGhyb3VnaCBhIERUIHNob3VsZCBlbmFibGUgYWxsIG9mIFpia2IsIFpia2Ms
IFpia3gsIFprbiwgWmtyIGFuZCBaa3QuCj4gRm9yIGV4YW1wbGUsIHNldHRpbmcgdGhlICJyaXNj
dixpc2EiIERUIHByb3BlcnR5IHRvICJydjY0aW1hZmRjX3prIgo+IHNob3VsZCBnZW5lcmF0ZSB0
aGUgZm9sbG93aW5nIGNwdWluZm8gb3V0cHV0Ogo+ICJydjY0aW1hZmRjX3ppY250cl96aWNzcl96
aWZlbmNlaV96aWhwbV96YmtiX3pia2NfemJreF96a25kX3prbmVfemtuaF96a3Jfemt0Igo+Cj4g
cmlzY3ZfaXNhX2V4dF9kYXRhIGdyb3dzIGEgcGFpciBvZiBuZXcgbWVtYmVycywgdG8gcGVybWl0
IHNldHRpbmcgdGhlCj4gcmVsZXZhbnQgYml0cyBmb3IgImJ1bmRsZWQiIGV4dGVuc2lvbnMsIGJv
dGggd2hpbGUgcGFyc2luZyB0aGUgSVNBIHN0cmluZwo+IGFuZCB0aGUgbmV3IGRlZGljYXRlZCBl
eHRlbnNpb24gcHJvcGVydGllcwo+Cj4gQ28tZGV2ZWxvcGVkLWJ5OiBDb25vciBEb29sZXkgPGNv
bm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+IFNpZ25lZC1vZmYtYnk6IENvbm9yIERvb2xleSA8
Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gLS0tCj4gVGhlcmUncyBiYXNpY2FsbHkgbm9u
ZSBvZiB0aGUgb3JpZ2luYWwgcGF0Y2ggbGVmdCwgc28gSSBoYXZlIGRyb3BwZWQgdGhlCj4gY28t
ZGV2ZWxvcGVkLWJ5cyBhbmQgc2lnbmVkLW9mZi1ieXMgZnJvbSBiZWZvcmUuIEl0IGRvZXMgbmVl
ZCBvbmUgZnJvbQo+IHlvdSBub3cgdGhvdWdoIEV2YW4hCgpPb3BzLCBJIGhhZG4ndCByZWFsaXpl
ZCB0aGlzIHdhcyBibG9ja2VkIG9uIG1lIQoKU2lnbmVkLW9mZi1ieTogRXZhbiBHcmVlbiA8ZXZh
bkByaXZvc2luYy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
