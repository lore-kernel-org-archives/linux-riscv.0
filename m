Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FE1C05027
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 04:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q0J+w+KExwPE/bo+7BYDhZY8f1AcNLleCIUkolkDHR4=; b=QL1llpy5cMi8MB
	jzQ/gA1TGA668M5pREk/MBVoXuJpXnnY8Pk8dgDFQG19SuleLqRM41AuxSQG/rUE1fxdLDkQHw395
	P5PdpIptqJYZzt5M+Stbnan/r1gD8Dkbh+9qyirxw/8eUpb/ZlcHLEekEzhZpd1l2gEKLux1pEkeN
	Z/5lC8k2rc/9dqsJXvboYmcVx2znxJ3c60Y32VYSL/mhitVAAm10S8c0spaSbwBG9W/VPHa7WEgDg
	8spMCcPF79BhVBjI6MQMwJ0Kqk8kDYdtPw5c2f9yQqGZoHx2y9eam4YvfrM1XSZfo+1lc/utUdOP7
	705DsKMOfYb0/CM7BGrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRn99-00HRNQ-4o; Tue, 14 Feb 2023 04:42:27 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRn95-00HRMx-T5
	for linux-riscv@lists.infradead.org; Tue, 14 Feb 2023 04:42:25 +0000
Received: by mail-pg1-x52d.google.com with SMTP id c29so5394435pgm.5
        for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 20:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IytFRD13wyHkORVwldfX0cj+olMfAcIjoNBkr5UdNv4=;
        b=CpaV4dVNUa0pCGK5PDzg426zSTmY7CxCQXGkQc/due8N9WbSNf6YnYNaaZJlzPQzRU
         4s0iVdibYJ1vax2anrQWNpvuZAStqApzDgYGWguJpL56MKYEoQgZaI+vmNIiamU8lFDV
         tyzEA6plQxp7DGNo3rrpCE6kEmRoWISwepZNgWnkKgHTSGrSSjYfZw8BEh9uYnOmnu1y
         3zFRl0bQ3jXcROaXtBLT4UglIskyT4lWVFuYiMxAiHOSaik7J+HXrvgqyyWxXOa5eCoY
         Ns5YOAcrrMGyhU6lBeuM1ckz+k2ZSKU+hls5ed89+Q3rPD5x9fgKjshULNq9RO13E66x
         s13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IytFRD13wyHkORVwldfX0cj+olMfAcIjoNBkr5UdNv4=;
        b=O2BU2BaOtHtIgFX9wBR1d8bJwDjeVSkSLjPC9CfJkjOXBi3BvtC15N+sdaBOnXw5Jl
         dul2CjyR3yDINtYtJiND17nR2aNiqWSjHOThvTBWkKTrOAtXk/7SXCKDDNS3zRYsPZQa
         9zy8i1mvPyDNG8GR0n/7BfXeTsk/WXrWsODmgithg+CaBlw7eQLHM210ibKwJKOYheXi
         PrzbKzUv1CeCH/HbUdDZdXDxYtSY939nIxnx+pXn4CPFiOqG0vrMzi4++wzY0o6jIVIh
         Q91kyRwO6yOKC+nKYxkpanG6JtNqgP3XaHcEBr4uadHHjXVOPqQlmUQntnWY4F5x47h6
         BWqA==
X-Gm-Message-State: AO0yUKUmpzYeITjn3/8+pHsy4Zfvygy3rcaurK9ugpDIw9Nb9i2sYP8x
	ffAcoTKzX976jwbELKGDLZww0w==
X-Google-Smtp-Source: AK7set/4s/cLnv837AHxP+fni/9CnhX3OJuvf1GQstOD0qP6CHuBqukJFcvLiwos3jjiUZAL1jHLxQ==
X-Received: by 2002:aa7:973d:0:b0:5a8:be36:65a8 with SMTP id k29-20020aa7973d000000b005a8be3665a8mr750675pfg.27.1676349742500;
        Mon, 13 Feb 2023 20:42:22 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id i9-20020aa79089000000b0058173c4b3d1sm8285835pfa.80.2023.02.13.20.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 20:42:22 -0800 (PST)
Date: Tue, 14 Feb 2023 10:12:13 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <apatel@ventanamicro.com>, linux-doc@vger.kernel.org,
	Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH 06/24] RISC-V: ACPI: Add PCI functions to build ACPI core
Message-ID: <Y+sRJVf985vXvQG/@sunil-laptop>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-7-sunilvl@ventanamicro.com>
 <33DF2416-0629-414D-B50E-D99CB55A83AA@jrtc27.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <33DF2416-0629-414D-B50E-D99CB55A83AA@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_204223_981798_2C07F081 
X-CRM114-Status: GOOD (  10.75  )
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

T24gTW9uLCBGZWIgMTMsIDIwMjMgYXQgMDU6MjY6MTNQTSArMDAwMCwgSmVzc2ljYSBDbGFya2Ug
d3JvdGU6Cj4gT24gMzAgSmFuIDIwMjMsIGF0IDE4OjIyLCBTdW5pbCBWIEwgPHN1bmlsdmxAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPiAKPiA+IFdoZW4gQ09ORklHX1BDSSBpcyBlbmFibGVk
LCBBQ1BJIGNvcmUgZXhwZWN0cyBmZXcgYXJjaAo+ID4gZnVuY3Rpb25zIHJlbGF0ZWQgdG8gUENJ
LiBBZGQgdGhvc2UgZnVuY3Rpb25zIHNvIHRoYXQKPiA+IEFDUEkgY29yZSBnZXRzIGJ1aWxkLiBU
aGVzZSBhcmUgbGV2cmFnZWQgZnJvbSBhcm02NC4KPiAKPiBQcmVzdW1hYmx5IHRoaXMgaXMgcHJl
dHR5IGdlbmVyaWMgYW5kIGFwcGxpZXMgdG8gYW55dGhpbmcgd2l0aG91dCB4ODYKPiB3ZWlyZG5l
c3MuIENvcHlpbmcgYWxsIHRoaXMgc3VwcG9zZWRseSBhcmNoaXRlY3R1cmUgc3BlY2lmaWMgY29k
ZQo+IHRoYXTigJlzIHJlYWxseSBnZW5lcmljIHNlZW1zIGxpa2UgYmFkIHByYWN0aWNlIHRvIG1l
IGFzIGFuIG91dHNpZGVyLgo+IFNob3VsZCB0aGlzIG5vdCBiZSB1bmlmeWluZyB0aGUgdHdvIGlu
IGEgc2hhcmVkIGxvY2F0aW9uIGFzIGhhcyBiZWVuCj4gZG9uZSBmb3Igb3RoZXIgc3Vic3lzdGVt
cz8KCk1ha2Ugc2Vuc2UuIExldCBtZSBhZGQgdGhlc2UgZnVuY3Rpb25zIGluIGEgY29tbW9uIGxv
Y2F0aW9uIHBjaS1hY3BpLmMKZm9yIFJJU0MtVi4gT3RoZXIgYXJjaGl0ZWN0dXJlcyBjYW4gbWln
cmF0ZSB0byB0aGlzIGluIGZ1dHVyZS4KClRoYW5rcywKU3VuaWwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
