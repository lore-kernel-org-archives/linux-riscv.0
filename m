Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0EFD42BBF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Nov 2024 19:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R6MXBR9x4ybXDxqadGOUagrSv8fa1N/u++dX5BeCjME=; b=JFltTrK5rqkdLw
	cDY4DH7u39vxtz9bB3WbJq+DVT4XuCQ9PxaZ2On4k1/63hgm/H3ebhHuo16hih+eaQw2RRERXjeEc
	PbNbKPsmzKxu4xAQigLozg+EQrmHorNf27AoCnNcXNMToL41/KcSxpfyOjg+QcwEebS6IOAYRqn+d
	c3AVA6BHubMtiT/lQdWaIKGfedxWgpDCiQT0rLbakhM4/IWmUlSxaZ0JyzscG9LWGcKbbURqR9mN0
	Sk9baZnVmDaKubrVd1skVoPlJ+G7SJTrQnGB7RYYUxfodQYXNv+B24+a5xLiBGfd7+ZANy5/RZJSF
	QsnjIZRbZUJHcZLsbnLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAwEI-00000004eoo-1CHA;
	Tue, 12 Nov 2024 19:07:10 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAwEE-00000004eng-3Gbx
	for linux-riscv@lists.infradead.org;
	Tue, 12 Nov 2024 19:07:08 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-720be27db74so46652b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Nov 2024 11:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731438426; x=1732043226; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LsDwXecVIrAlSTQ6V1mobheD8FZMwXU4s1gVF5Uq0Iw=;
        b=EAymyHwMGM/xDCfFjYZyHU7EPciCBoAXO76dgcK0iQlZl9FtttN+JeiP9yyV6cm5AW
         U5xJHXmgZ2AhCKYHSx5KJo+W6J+SiDp8oMfgJVOh0alFQ7JqATlZlrQcMicQXUCMoKml
         4ziV87IgR8l7+L/iogwHPzE61vrNUgQyGPi8VBy/bt/EIjGRlp5ZOe/bpAJGqRswK2Ip
         r1Cv4r6DEsQFWvAD2/WQDcn19r3Ssu7UIAHtIfuRPggeQVBcZGHMGZNaBN1FZWNe50z3
         INGIzzivIlO3In7tiLiUngdu4UwAtuP+3Qdo6nHRBeeQ+aUAwBLAKssfpEd01MQHGHxv
         /KMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731438426; x=1732043226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LsDwXecVIrAlSTQ6V1mobheD8FZMwXU4s1gVF5Uq0Iw=;
        b=iG3AkUfFMVxujLa/8DGhuBY1IkdQ7eWp6sJlFrdhvyEjRkI4LWplPF26lGBxd6MQ64
         lrBvNbVMmvwZfLt1u4CmpPEYqPMRZ7Ln7FgfILjBRYtlGt/BzEvIJDLFlMDtyC5GOcx4
         WQOPEetq8g5X8uVnek4AU6Yjsgpms1gi+7ZVm3J9aiLaj1zEXfqA8amcrrOIKVk9c8Xe
         G5x/sghTkBcbpRz2wDotjYlMoxlaU41BPQDzKzzilbhE441/mmCnM+tr49i7FzFIZH7j
         W0jlNTftgPodM/8kzQQbBSt6c1Zhg6UAAPy9s/EHXeGjUHBq0ZvKvASmUJA1+i8gLDXm
         JPzA==
X-Forwarded-Encrypted: i=1; AJvYcCV9WR4anUXFXP3060/n4YfAPbkDpQeHwiVbS3DdjUD8l/tBazZhIzQsXU7G4AlUnmhmtg/SyRcxwbhE7g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzlx/rB3tvO9OBcSCTG+nggrG3Y17TkZZt23W9Bi8inQ+yPyUrh
	hT+mHU8jNzWfVRnYJOSKw2n6KK7HZ8tkxCdT9YGWOO1NQEigG1FvO0NHco7aWLTUBHQcFkxVvUV
	bqkV9RuDcuLYsJin54cyenBr3grVNpeiaLhgkRg==
X-Google-Smtp-Source: AGHT+IHB097GZ6fVk/rpRwAIUQNKKHv7J0PFUbREBu/PTKn/4UbitylkvuPDjSzAmny8aHcHd88vY6+lORGpbC6yPhs=
X-Received: by 2002:a05:6a00:841:b0:71e:6a99:4732 with SMTP id
 d2e1a72fcca58-724140a67d7mr26723911b3a.11.1731438425637; Tue, 12 Nov 2024
 11:07:05 -0800 (PST)
MIME-Version: 1.0
References: <20241112113422.617954-1-alexghiti@rivosinc.com>
In-Reply-To: <20241112113422.617954-1-alexghiti@rivosinc.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Tue, 12 Nov 2024 11:06:54 -0800
Message-ID: <CAHBxVyFUoiBNbJUCieS1cnVyTwUOModNL6b70wbMV4-z3GJEzQ@mail.gmail.com>
Subject: Re: [PATCH -fixes] drivers: perf: Fix wrong put_cpu() placement
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_110707_014150_5E2887EE 
X-CRM114-Status: GOOD (  16.99  )
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

T24gVHVlLCBOb3YgMTIsIDIwMjQgYXQgMzozNOKAr0FNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBVbmZvcnR1bmF0ZWx5LCB0aGUgd3JvbmcgcGF0
Y2ggdmVyc2lvbiB3YXMgbWVyZ2VkIHdoaWNoIHBsYWNlcyB0aGUKPiBwdXRfY3B1KCkgYWZ0ZXIg
ZW5hYmxpbmcgYSBzdGF0aWMga2V5LCB3aGljaCBpcyBub3Qgc2FmZSBhcyBwb2ludGVkIGJ5Cj4g
V2lsbCBbMV0sIHNvIG1vdmUgcHV0X2NwdSgpIGJlZm9yZSB0byBhdm9pZCB0aGlzLgo+Cj4gRml4
ZXM6IDI4NDBkYWRmMGRkZSAoImRyaXZlcnM6IHBlcmY6IEZpeCBzbXBfcHJvY2Vzc29yX2lkKCkg
dXNlIGluIHByZWVtcHRpYmxlIGNvZGUiKQo+IFJlcG9ydGVkLWJ5OiBBdGlzaCBQYXRyYSA8YXRp
c2hwQHJpdm9zaW5jLmNvbT4KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAy
NDA4MjcxMjUzMzUuR0Q0NzcyQHdpbGxpZS10aGUtdHJ1Y2svIFsxXQo+IFNpZ25lZC1vZmYtYnk6
IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgZHJpdmVy
cy9wZXJmL3Jpc2N2X3BtdV9zYmkuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGVyZi9y
aXNjdl9wbXVfc2JpLmMgYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCj4gaW5kZXggMzkx
Y2ExNDIyY2FlLi4xYWEzMDNmNzZjYzcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9wZXJmL3Jpc2N2
X3BtdV9zYmkuYwo+ICsrKyBiL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKPiBAQCAtMTM5
Myw4ICsxMzkzLDkgQEAgc3RhdGljIGludCBwbXVfc2JpX2RldmljZV9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0X3Vu
cmVnaXN0ZXI7Cj4KPiAgICAgICAgICAgICAgICAgY3B1ID0gZ2V0X2NwdSgpOwo+IC0KPiAgICAg
ICAgICAgICAgICAgcmV0ID0gcG11X3NiaV9zbmFwc2hvdF9zZXR1cChwbXUsIGNwdSk7Cj4gKyAg
ICAgICAgICAgICAgIHB1dF9jcHUoKTsKPiArCj4gICAgICAgICAgICAgICAgIGlmIChyZXQpIHsK
PiAgICAgICAgICAgICAgICAgICAgICAgICAvKiBTbmFwc2hvdCBpcyBhbiBvcHRpb25hbCBmZWF0
dXJlLiBDb250aW51ZSBpZiBub3QgYXZhaWxhYmxlICovCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgcG11X3NiaV9zbmFwc2hvdF9mcmVlKHBtdSk7Cj4gQEAgLTE0MDgsNyArMTQwOSw2IEBAIHN0
YXRpYyBpbnQgcG11X3NiaV9kZXZpY2VfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKPiAgICAgICAgICAgICAgICAgICAgICAgICAgKi8KPiAgICAgICAgICAgICAgICAgICAgICAg
ICBzdGF0aWNfYnJhbmNoX2VuYWJsZSgmc2JpX3BtdV9zbmFwc2hvdF9hdmFpbGFibGUpOwo+ICAg
ICAgICAgICAgICAgICB9Cj4gLSAgICAgICAgICAgICAgIHB1dF9jcHUoKTsKPiAgICAgICAgIH0K
Pgo+ICAgICAgICAgcmVnaXN0ZXJfc3lzY3RsKCJrZXJuZWwiLCBzYmlfcG11X3N5c2N0bF90YWJs
ZSk7Cj4gLS0KPiAyLjM5LjIKPgoKUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
b3NpbmMuY29tPgpUZXN0ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
