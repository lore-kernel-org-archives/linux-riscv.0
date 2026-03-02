Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021C7E9B37D
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 13:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ihNThxwCTegRYaEvhC8U7/nX6XPGB+TQR9sZ5hvWfAQ=; b=mlULFUc7+R/UwW
	v0lEU91L0Ulybv/b5GOF0gRowW+449YcXuY7z4OFe9BPtUpudy60rGErUJNw4l0enUYCF3mk+IVxs
	GunR0d8fEAowYki/K9WjfHm+gK/T5ycfBoutpnu+Rihm6ruzuSCyoC2aCPgL57wHeFy02bnUOZqeY
	lzsKitCLVFZ9liThU2NrLwNvkl6mv66Av09Dt1igngow7A6tYh5zJuc6jf5UrsM4r1oJJn4MGhmkT
	EG+OWGadObn7byAOoZbHT8kkyF71+TAhQYpwUfBZfCyeiuPSrEZl0h+LCsfPflcDJX9Vhm1t6XFwx
	zr/bn0Ku0COhfZu3Gw1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx32T-0000000D4Sv-2Jff;
	Mon, 02 Mar 2026 13:10:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx32S-0000000D4SE-1PjU
	for linux-riscv@bombadil.infradead.org;
	Mon, 02 Mar 2026 13:10:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=M3t7J1xADn6LVhsHjUSboELrYldQwpli53K6JflTiRU=; b=AOAwAE2Cm7BehGjcwzlks20zMl
	dZ8xvrC1BwZhyG/BDoIYwhB1TGWv2hsDQfzo2gUdzozxTkFoM2/uC/s62kkLTARTKvWvvelXB/NB9
	7GBcN12umA/ZzG2rb9octauuCPf85o5dTcD4z5DkEQj0Xw4wXG8UUfo4Audy/CfAbcFnRbPhj+5Tv
	gQKdMO+t11dTAvoBmD8KZdatwJaJwIxsiIL5XnLZGfwI2c70Fs6g7/CWSKa7A7CEVMDT3fF01TPTi
	IP8tNoEL1cRpRm6dKdZFpqNXQVDYz/+sQ6tWI9d6APummJzUuWf1QZnsxqTszYVImk6mwL2c5E9MS
	D7K90dDg==;
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx32O-000000007nK-3Oc9
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 13:10:19 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-679501fac3cso2979125eaf.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Mar 2026 05:10:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772457014; cv=none;
        d=google.com; s=arc-20240605;
        b=VoEdC9dM0D1+QsG8J8FLdaRA+u43ivhpvGkuzhqLcgaLu2YbSnkRD7RwhC/+ashLvt
         sNBT2ar9qJwDL6/E48QiA9+aGOS3CyiCibCx+lk1mu0PelcHG34GVgIQ83KSwVzJjCAv
         1C40nbLwP7PXJeUT/jDMsKckFzgGKqSQ15ZYMJEbdtFp/nGXEBrFKhEn7A7ijDPK2hHo
         cH4rjFB84ilbk5f6wCcUtZDNFypOdWTBDUvFLVyP8eplxgwaki3DhWh9oRaZUdZCiWMs
         Y1wOgRrvU8OzhFTBPD9o2N/gaFrKIkTvcrNIIEOoJtoYyr3S4qjpPTuR4Pvfc4A0Y1ip
         Yr2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M3t7J1xADn6LVhsHjUSboELrYldQwpli53K6JflTiRU=;
        fh=io0UlKKhbOXhP+MAXfDketHEvDpg3EhDWyz2MNiYQKg=;
        b=azUZ0QbEOxadFH8CtTzank+j8NE7dCurfJtXgAosHfgs6xfxiCIULF00/TEhnzD1fv
         g8vtF8HW2r+QmxuxD8X+7IUOq2aHOjtKPgJtP50lfSLMZSobRKHq+gsmMtpwgDeUj3da
         HoxxFFtXj8fJwcfUqyO5rXx89JHzQGsitoGrWMYibnwroUU2RDDKJkSVcWOUtSAV1Lw9
         YZmPhGpzLCaRPvP7pREptRgLeDiBOkPlH+wfme37ui2XYViFMU5UdX0bcfLadHzSQu4R
         IhFv4yCuanl96jZoHblHOqaE5LxuGOLeRmuUyE7fYZ2uqyp8u7ZQJhsGpFG/SvLLj8Dl
         4XUA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772457014; x=1773061814; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3t7J1xADn6LVhsHjUSboELrYldQwpli53K6JflTiRU=;
        b=X+GPb+U203k4sEHEmWS/YQCkk1BFxo9c83M26E6HJFmEpi44eIN2WATiO7YgRQ0+IR
         zpszoToA4ooWwLGRmAToY4jQzY4gBnUiBs3I7GmjltLAKK6KTISsQzM5EelJKXr2IA6o
         sIHh+CNb0XNERM+s14abOk0BHEbiWhMKqw0yML0/AATf/GHjShfkcpBKs091Qk/TR3sT
         zeq+KVpxQqACaGfSr/1+AxL2NarhtFyrhAz26+XlUQQC7uhyTpjRXDhJlSrAfBmY9PXf
         eJJJCihDQhSmQSIYd4kDndCo4ZNlrb7yp0Ye57AE7CcbZdui1M+sbQx70h0KfBU1hyic
         LPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772457014; x=1773061814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M3t7J1xADn6LVhsHjUSboELrYldQwpli53K6JflTiRU=;
        b=Spva6AM49X0YpY7w5ClmuvcPEikWGD0hnhR7xlH+3y+aDZ9NEoII/9OSlac9YHYVwH
         PQ49j69buyOUvAymQkslccKr8FQvNpNTK4vJeuL6A1Y4WnQjW9ls8Rms6vLIA+1xF3MP
         T75CWT7Ask0vsdqg6osETo7NAN7TM1HQFMeo3XnKFGfJwNYoZ1gCfk980QNJ+um6RKTH
         YvTTYZSxfrnnilnJIZSJqnGPonKxVfcFeZ+iaO60dSA/laJ67zwt/e6YHCv8UFNkG5hU
         eJyRxVsrZVVDfbxqMOs+85ERlQ2vrzCx9yh6D8+GBFnJfZHSzm08QgKdPqmj7eFkaHjN
         TVVw==
X-Forwarded-Encrypted: i=1; AJvYcCWuI/48GUnImLAGH107KWgEUaWGaVJiLRWZleIov/w8KgpniIDxpYlNRRN24c85o+jJ9Fu2Z6evigiF9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywkwfgsh2SEO03sy0lmypMpGU8lba6FY8gU2/EumwMWJwvJ7nrX
	zNRSma4DpsoyLzVd/3gXQZeaRWFc2BlAvtd35ob+qvzvzZ/Sh31sz9d5J4Kz4rOWR53f3Y4fkMM
	iAHZvefHXMjgLVdW1wmpBT3F3PNWsGlIAFkHOLMWFIw==
X-Gm-Gg: ATEYQzx34lC/LFopRgUUxW6ovu1iqhiEBHVl6vmg32dQ/ZnWv0Hz/vhcRoFkyfih8qZ
	pQJmrooFlOBMlToyM7YgKXajEjFurzQbJvW1SlntTQ8YP8xIoDyJXwhE1NNDcbJ7e32kcSUMYkh
	UGUPOn8dLW57wAwG0E/m061hex3Wu4bY/BZJXO6wlRXk3UnwmWu3GEhIH4CoIHaW0WQwNPY2thg
	Ygi7dzDLvVrqNJWAI/olA7uQIrNzJN9/4eMh+qU6xk54s+BFR4/kXnoH1PU1xjzMzvyi2qaPj+P
	gqqqLsWv9Kphvj5vSTUGYD7WKeExiwwsa9OFHZdLfp1KIJbWO4G/ilxmbIUSDMKBjhZ19SyIgIC
	NuLcBVsyxUoDpenIQqB2U2WmSBQ==
X-Received: by 2002:a05:6820:8c1:b0:66f:280d:56b0 with SMTP id
 006d021491bc7-679fae14ee6mr6760772eaf.16.1772457013949; Mon, 02 Mar 2026
 05:10:13 -0800 (PST)
MIME-Version: 1.0
References: <20260227134617.23378-1-radim.krcmar@oss.qualcomm.com>
In-Reply-To: <20260227134617.23378-1-radim.krcmar@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 2 Mar 2026 18:40:02 +0530
X-Gm-Features: AaiRm53jXd9YVl6VuWiDg3obNBJDRJ9uNjSZTeCJ9xO4OconUTj78RYwM-DvnGI
Message-ID: <CAAhSdy34OW-3n6z0BdWNShwYzwkmpr5L6MOXEypmCMqUOBu4zg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: fix off-by-one array access in SBI PMU
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>
Cc: kvm-riscv@lists.infradead.org, Lukas Gerlach <lukas.gerlach@cispa.de>, 
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_131016_935364_D1896BBE 
X-CRM114-Status: GOOD (  17.33  )
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

T24gRnJpLCBGZWIgMjcsIDIwMjYgYXQgNzoyMOKAr1BNIFJhZGltIEtyxI1tw6HFmQo8cmFkaW0u
a3JjbWFyQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gVGhlIGluZGV4ZWQgYXJyYXkgb25s
eSBoYXMgUklTQ1ZfS1ZNX01BWF9DT1VOVEVSUyBlbGVtZW50cy4KPiBUaGUgb3V0LW9mLWJvdW5k
IGFjY2VzcyBjb3VsZCBoYXZlIGJlZW4gcGVyZm9ybWVkIGJ5IGEgZ3Vlc3QsIGJ1dCBpdAo+IGNv
dWxkIG9ubHkgYWNjZXNzIGFub3RoZXIgZ3Vlc3QgYWNjZXNzaWJsZSBkYXRhLgo+Cj4gRml4ZXM6
IDhmMDE1M2VjZDNiZiAoIlJJU0MtVjogS1ZNOiBBZGQgc2tlbGV0b24gc3VwcG9ydCBmb3IgcGVy
ZiIpCj4gU2lnbmVkLW9mZi1ieTogUmFkaW0gS3LEjW3DocWZIDxyYWRpbS5rcmNtYXJAb3NzLnF1
YWxjb21tLmNvbT4KClRoYW5rcyBmb3IgY2F0Y2hpbmcuCgpSZXZpZXdlZC1ieTogQW51cCBQYXRl
bCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGlzIHBhdGNoIGFzIGZpeGVzIGZvciBM
aW51eC03LjAtcmNYLgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1
X3BtdS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jIGIvYXJjaC9y
aXNjdi9rdm0vdmNwdV9wbXUuYwo+IGluZGV4IDRkOGQ1ZTlhYTUzZC4uYWVjNmIyOTM5NjhiIDEw
MDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMKPiArKysgYi9hcmNoL3Jpc2N2
L2t2bS92Y3B1X3BtdS5jCj4gQEAgLTUyMCw3ICs1MjAsNyBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVf
cG11X2N0cl9pbmZvKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbG9uZyBjaWR4LAo+
ICB7Cj4gICAgICAgICBzdHJ1Y3Qga3ZtX3BtdSAqa3ZwbXUgPSB2Y3B1X3RvX3BtdSh2Y3B1KTsK
Pgo+IC0gICAgICAgaWYgKGNpZHggPiBSSVNDVl9LVk1fTUFYX0NPVU5URVJTIHx8IGNpZHggPT0g
MSkgewo+ICsgICAgICAgaWYgKGNpZHggPj0gUklTQ1ZfS1ZNX01BWF9DT1VOVEVSUyB8fCBjaWR4
ID09IDEpIHsKPiAgICAgICAgICAgICAgICAgcmV0ZGF0YS0+ZXJyX3ZhbCA9IFNCSV9FUlJfSU5W
QUxJRF9QQVJBTTsKPiAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gICAgICAgICB9Cj4gLS0K
PiAyLjUxLjIKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
