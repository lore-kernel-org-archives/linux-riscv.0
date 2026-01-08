Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB56D148A0
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 05:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vrGuqFOB5R5CW67UiOjDE32afRKLmXmlfsxyNpR6ar8=; b=hWxOca6BPvKecT
	5Nh+nby2Ao/iQwXjK6JjRkC+sg3yRmYQdAzWnUHn9fat8fGKeDfrXpTSWyjNCpGh2uJmdRjZFPAp4
	C5Wj5zvMsK5NbGcjMUFk+nlfZPi0CFQu2DRglky9ID7VUnJJQXQ0ONQDtjvzLrQBaSyGY88UBMe1A
	3v015T/IDFyLA96PPq0EWaCROb8Ac3yt96Z6PDDfzomcYDA2pkIdKIDPegfY2n9jNlSY7roIpC2Vg
	o1zLWB1GVDltTqcfGxnYZ4UbG0cXhdse592++DWgT1c3mm0i6Jy5CkVotrXyxER3IslFd+LcPfRr4
	7PhxswyZVwZo3JpOZbuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdiYy-0000000Fx39-0u0a;
	Thu, 08 Jan 2026 05:28:00 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdiYr-0000000Fx2a-27h6
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 05:27:58 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-6466d8fd383so2661040d50.2
        for <linux-riscv@lists.infradead.org>; Wed, 07 Jan 2026 21:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=summations-net.20230601.gappssmtp.com; s=20230601; t=1767850071; x=1768454871; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BC+osoIwsp+MvsvfieiIYrUxWM9BGrlddB8KAIiHx4w=;
        b=qXPaPhTZNMl6lBdxuFQx23Zi8LOz47r+GrIWML75kW0MGGYVryYEFz8xC6cWsxSfg7
         isPpsj8lZcQFAzOBKeMys0DlpuWZqn1J67Vsk9Pfu/CkRro2fl5wI9RQJrgdN1CzcVBd
         YplN0f+F4xGrvty2cOf90FrFNAPXGK+/eHHlNtegNDsPmE0lxA+ms0aghXQPBDGHqApk
         sOFdDLpG7GVFatgzuWrsF3ZpqJI/M57f2H4N4ZBnZSAq8ZmSkPLahTJqkugxM7w1ytbz
         i0VxHAjpW+hSrGBBVgoKe2HF1Oo6bx0qTQon+STldFlX0rci5V6oo1wN7NlPOiSTAPdc
         XEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767850071; x=1768454871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BC+osoIwsp+MvsvfieiIYrUxWM9BGrlddB8KAIiHx4w=;
        b=nl7fsgDVclN6iYAemlFZsxmI+GEpc0uU0xz/ZbAhv6jSMWyyV2NYW7tDpXujNOMM+z
         ME8MO2ZajKufWG6RreXSs8xx+O7DT7jeE3UaARj9BPwCVhK0vf7JFTMvjZbqqwHgpRvp
         60yTvy/tXJgJ1Wg9faIDEJhetBEiWzumSEqL1aNK3lhBPqXNbpPzDOUC7rfagXu2h7P1
         uUKLnM437thInsgbCGIe+ogA8NmnxIrJ8MVmOkTofScD/2bPoyryAThgbqjCs79vuTfq
         z8bdfv9UVdcGowazSAy7DF5zEERq2SvrbheTU6LaBS4HK8xBGKjFmDHPc1dMWNmYYrnv
         AsTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvwVMuxiqzIo0qbXTqkO/FuiCiRsO706/q/nkxMhtMc4Vbt0IiWo9qMuirWLNxaSuDVHA+56kLa1sACg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yynve39jlfJgPm4hR1rdyL+m4WQipeMb6QzDjghTnrTKkXQyFb4
	lFWahyrqHwcJYk/qsQNIzgyy5LP7pidZ4gy+8vxoN0L2qE27QOZewwh0S9eMyXuBx+HrQcc9eqJ
	C0mXHXUDe20OmLhvmk024JI+4utRPy9C7kFEWkUmFnt8=
X-Gm-Gg: AY/fxX7tU/mmDgkEoaRvXNuY0MtxnogayzMQgt+xhwCGDEEWAvCWPjqIeDKtYGeFQj0
	cgPu6Kkv5ff6i1zyWqwzdiG504czYpbUPWbCGnkY4wVwHuDxghqi6aHlXgsLXXwhiXJI0auYeXM
	6UDUAp4/cbpmYO8bVClNE8YMtkatXdftMINOTo4YlI1te0eflL3puCTce21QBa707iCURgF/gn4
	GWRgPzyVArNaVvIsGLa2zDI4kTuwcwyxKi79NKfVWT29+Xzd56JzqoLYJKVGdmAj7CGnsnKuMeo
	U50QpNK9PBF/jlbxun4d7WRQS777
X-Google-Smtp-Source: AGHT+IFOgL9QuUd80/piaFldcHRAVd0y782EaLehHJfIPXTxtTytmiYz4W9EajgqaU/7OrfDZq3ETfFnz3U6oZf/2iM=
X-Received: by 2002:a05:690e:120f:b0:641:f5bc:696c with SMTP id
 956f58d0204a3-64716c60119mr4870525d50.72.1767850071169; Wed, 07 Jan 2026
 21:27:51 -0800 (PST)
MIME-Version: 1.0
References: <20260106092117.3727152-1-joshua.yeong@starfivetech.com>
In-Reply-To: <20260106092117.3727152-1-joshua.yeong@starfivetech.com>
From: Rahul Pathak <rahul@summations.net>
Date: Thu, 8 Jan 2026 10:57:39 +0530
X-Gm-Features: AQt7F2qhmjlZCACoqEpff45oADUXIoYNWJ-4094MakljrIym7FWPaVOI4-KiK_c
Message-ID: <CABdD5xkq=LbaUo=jDGSF2U2Rb0r13EEJQMfSjxEMsSX0mCDyhQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] RISC-V: RPMI performance service bindings and cpufreq support
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: anup@brainfault.org, leyfoon.tan@starfivetech.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, rafael@kernel.org, 
	viresh.kumar@linaro.org, sboyd@kernel.org, jms@oss.tenstorrent.com, 
	darshan.prajapati@einfochips.com, charlie@rivosinc.com, 
	dfustini@oss.tenstorrent.com, michal.simek@amd.com, cyy@cyyself.name, 
	jassisinghbrar@gmail.com, andriy.shevchenko@linux.intel.com, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_212753_877768_99DC9B41 
X-CRM114-Status: GOOD (  15.04  )
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

T24gVHVlLCBKYW4gNiwgMjAyNiBhdCAyOjUx4oCvUE0gSm9zaHVhIFllb25nCjxqb3NodWEueWVv
bmdAc3RhcmZpdmV0ZWNoLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoIHNlcmllcyBpbnRyb2R1
Y2VzIHN1cHBvcnQgZm9yIHRoZSBSSVNDLVYgUlBNSSAoUklTQy1WIFBsYXRmb3JtCj4gTWFuYWdl
bWVudCBJbnRlcmZhY2UpIHBlcmZvcm1hbmNlIHNlcnZpY2UsIGNvdmVyaW5nIGJvdGggRGV2aWNl
IFRyZWUgYmluZGluZ3MKPiBhbmQgYSBjb3JyZXNwb25kaW5nIGNwdWZyZXEgZHJpdmVyLgo+Cj4g
VGhlIGZpcnN0IHBhcnQgb2YgdGhlIHNlcmllcyBhZGRzIFlBTUwgYmluZGluZ3MgdG8gZGVzY3Jp
YmUgdGhlIFJQTUkgcGVyZm9ybWFuY2UKPiBzZXJ2aWNlIGFzIHByb3ZpZGVkIGJ5IHBsYXRmb3Jt
IGZpcm13YXJlLCBhcyB3ZWxsIGFzIHRoZSBzdXBlcnZpc29yLWxldmVsCj4gY29udHJvbGxlciBp
bnRlcmZhY2UgZXhwb3NlZCB0byB0aGUgb3BlcmF0aW5nIHN5c3RlbS4gVGhlIGJpbmRpbmdzIGFs
c28gZG9jdW1lbnQKPiBob3cgQ1BVIG5vZGVzIHJlZmVyZW5jZSBwZXJmb3JtYW5jZSBkb21haW5z
IG1hbmFnZWQgYnkgUlBNSS4KPgo+IFRoZSBmaW5hbCBwYXRjaCBidWlsZHMgb24gdGhlc2UgZGVm
aW5pdGlvbnMgYnkgaW50cm9kdWNpbmcgYSBjcHVmcmVxIGRyaXZlciB0aGF0Cj4gbGV2ZXJhZ2Vz
IHRoZSBSUE1JIHBlcmZvcm1hbmNlIHNlcnZpY2UgdG8gbWFuYWdlIENQVSBmcmVxdWVuY3kgc2Nh
bGluZyBvbiBSSVNDLVYKPiBzeXN0ZW1zLiBUaGUgZHJpdmVyIHN1cHBvcnRzIFJQTUkgYWNjZXNz
IHRocm91Z2ggU0JJLWJhc2VkIHRyYW5zcG9ydCBtZWNoYW5pc21zCj4gYXMgd2VsbCBhcyBkZWRp
Y2F0ZWQgc3VwZXJ2aXNvci1tb2RlIHRyYW5zcG9ydHMuCj4KPiBSUE1JIHNwZWNpZmljYXRpb24g
cmVmZXJlbmNlIFsxXSBhbmQgWzJdCj4KPiBUZXN0IEVudmlyb25tZW50IGlzIGFzIGZvbGxvd3M6
Cj4gaHR0cHM6Ly9naXRodWIuY29tL3llb25nam9zaHVhL2xpbnV4L3RyZWUvdjYuMTktcmM0L3Jw
bWktcGVyZm9ybWFuY2UKPiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytc29mdHdhcmUtc3JjL29w
ZW5zYmkKPiBodHRwczovL2dpdGh1Yi5jb20veWVvbmdqb3NodWEvcWVtdS90cmVlL3JwbWktZGV2
LXVwc3RyZWFtCj4KPiBVc2UgJy1NIHZpcnQgLU0gcnBtaT10cnVlJyB3aGVuIHJ1bm5pbmcgcWVt
dQo+Cj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LXNiaS1kb2Mv
cmVsZWFzZXMKPiBbMl0gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LW5vbi1pc2EvcmlzY3YtcnBt
aS9yZWxlYXNlcwo+Cj4gSm9zaHVhIFllb25nICg1KToKPiAgIGR0LWJpbmRpbmdzOiBmaXJtd2Fy
ZTogQWRkIFJQTUkgcGVyZm9ybWFuY2Ugc2VydmljZSBtZXNzYWdlIHByb3h5Cj4gICAgIGJpbmRp
bmdzCj4gICBkdC1iaW5kaW5nczogZmlybXdhcmU6IEFkZCBSUE1JIHBlcmZvcm1hbmNlIHNlcnZp
Y2UgYmluZGluZ3MKPiAgIGR0LWJpbmRpbmdzOiByaXNjdjogY3B1czogZG9jdW1lbnQgcGVyZm9y
bWFuY2UtZG9tYWlucyBwcm9wZXJ0eQo+ICAgY3B1ZnJlcTogQWRkIGNwdWZyZXEgZHJpdmVyIGZv
ciB0aGUgUklTQy1WIFJQTUkgcGVyZm9ybWFuY2Ugc2VydmljZQo+ICAgICBncm91cAo+ICAgTUFJ
TlRBSU5FUlM6IEFkZCBSSVNDLVYgUlBNSSBwZXJmb3JtYW5jZSBzZXJ2aWNlIGdyb3VwCgoKSGkg
Sm9zaHVhLAoKSSBoYXZlIGEgZ2VuZXJhbCBxdWVzdGlvbiAtICBSUE1JIHBlcmZvcm1hbmNlIHNl
cnZpY2UgZ3JvdXAgaXMKcHJpbWFyaWx5IGRlZmluZWQgZm9yIGRldmljZXMgYnV0IGNhbiBhbHNv
IGJlIHVzZWQgZm9yIENQVXMuCkRvIHlvdSBwbGFuIHRvIGFkZCBhIFJQTUkgZGV2ZnJlcSBkcml2
ZXIgdG9vIGZvciBkZXZpY2VzPwoKVGhhbmtzClJhaHVsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
