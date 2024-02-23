Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51984C54798
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 14:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p1XidXVEc6OyoJI5JjuhepiM2QsvFLn6+2CjmjzMxlI=; b=uM7Mnb2iaaOng7
	+r2Vk5RiuPSC3ZzJBR9r72cjkSMwOZzLdVZuFrzmj5rjZUv/cK8ygb0jN3Ju3mTQ1zMv7vNPSwqro
	NStmSasLDLZPe9ETn3PT6pRyKmUJT2H4JBtN9xtkxwrWDVIZw6TgLJ43blpsHCc7lZ9BEDWlIvRGw
	2WPW9t/6Dt8uR3d2Kifg/kpv1SLfmRjDPjYZ2+tdIytYc2itbZt1chleSR5B2aZT0d2I9fEN1AmyN
	VmpEN4mA+16XpplcA5yb2raSRBqflsXR9xok8CHwOVWD7jSU4fTjhcg6WO+W9YNxgJHlixAumu7oL
	5AWdY5iJkYJthlnJ56Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdWAC-00000009gRl-02dr;
	Fri, 23 Feb 2024 14:04:32 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdWA7-00000009gOa-11yT
	for linux-riscv@lists.infradead.org;
	Fri, 23 Feb 2024 14:04:30 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-21ea1aae402so380233fac.1
        for <linux-riscv@lists.infradead.org>; Fri, 23 Feb 2024 06:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1708697064; x=1709301864; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8g40GSj1SuM3MvNOVaVxi58BU8kqY9DyWAR2wyASV2c=;
        b=S0/bdllMNOqBg7RKwtIhbdjXM48aeUgz7w+lDte3g9x/6rR1QKBXt2/M1/ADCpYHN/
         Xssr7mRGUASeNAeW07lVDRHoxUPkZdvnYFFbRo4Choucco38Nt8LRw2kAIvix6t/FemP
         7Mmbqe6QjPBrapbtArMRFox3CmQYBOJQ7JasaoMVU37lisr2t5zulcoATW4N7RdNxDe7
         5/R8Cr6q0qlqUuykqg9h89ybC7TA8dE+urVIPGk/cDgHA27EzEf/CFeFbx+8JzXqdY4i
         1FLTB7gJG8unroTZ3d1xp7aFLL2BILDjY7Arq478Nt46CUH5OH9TcXJd3YMr6e4fV6EN
         ACZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708697064; x=1709301864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8g40GSj1SuM3MvNOVaVxi58BU8kqY9DyWAR2wyASV2c=;
        b=imjIDpddKKBg1vlQUtALXOm1aU4Eqv+kPh608hC05avPeT2/nFZMWjr1wyaGY/Ukw3
         R5/cN6J/0LyyHSRAGvW9ehggRURcHE9g8WS+5te1TeYeb9/ZtXHWfG4qc9MGbmarPr9P
         FbZGbQZLJg59dy7xrC9AwqH7Ug4BEkiapNOvDQ2MWmkxcPByRlC6gEMvOP7UEIMa4tPA
         6tB9MmlmXhPYYdwgo+LNWs/MEIOawXccBoMl0LnJnpGhG4CeP4jyBPUzS/tYQ3qX9KRB
         St/w02EOH2df0/TTNsyHIeewkYaIwR9t1G0dx4SyxBTFybx4+YDTUUkqqaDmHrNPmA7g
         gjlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUP/vJSmggsmyTs+0RVdub9n6kNjeAbZkQsbGzELWX7XFechM/WeFxFIfdXjtrNf/pa+iI6sC/aw/IbpLrW9zUpZCQ+UMDLzOXuwjvHNyhT
X-Gm-Message-State: AOJu0YzQSMVmpQlKfN0YcDAudP8AYnqSzLLpA8F05sSN5Lvr4gSwqTdq
	ZTJ14caCSNWHxoUopN6Qa3tMDoomHG3NjqkVDwvsJrQKzvqPRh9zU1gKWnKC1lRNwI58TqnO52n
	oMaS8SUxWw0bAuGYoitF8LEiX98HepeD7tRNm5w==
X-Google-Smtp-Source: AGHT+IHYBIX6HbsjNo7yyi7/bw4LuehBOxec802PGYW7ieaze/5sJtuWKqHmCdvfviB98HjMRINz+MEtpbXXzNcM6EI=
X-Received: by 2002:a05:6871:28a6:b0:21e:d92b:ef39 with SMTP id
 bq38-20020a05687128a600b0021ed92bef39mr2121534oac.27.1708697064350; Fri, 23
 Feb 2024 06:04:24 -0800 (PST)
MIME-Version: 1.0
References: <cover.1689792825.git.tjeznach@rivosinc.com> <CAHCEehJKYu3-GSX2L6L4_VVvYt1MagRgPJvYTbqekrjPw3ZSkA@mail.gmail.com>
In-Reply-To: <CAHCEehJKYu3-GSX2L6L4_VVvYt1MagRgPJvYTbqekrjPw3ZSkA@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 23 Feb 2024 22:04:13 +0800
Message-ID: <CANXhq0qsZS7sB-npPKdnFaWi2+yUc_dROCsVXZDHo07-a34wcw@mail.gmail.com>
Subject: Re: [PATCH 00/13] Linux RISC-V IOMMU Support
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Greentime Hu <greentime.hu@sifive.com>, linux@rivosinc.com, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, 
	Nick Kossifidis <mick@ics.forth.gr>, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_060428_050139_A9346ACD 
X-CRM114-Status: GOOD (  25.66  )
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

Pgo+IFRoZSBSSVNDLVYgSU9NTVUgc3BlY2lmaWNhdGlvbiBpcyBub3cgcmF0aWZpZWQgYXMtcGVy
IHRoZSBSSVNDLVYgaW50ZXJuYXRpb25hbAo+IHByb2Nlc3MgWzFdLiBUaGUgbGF0ZXN0IGZyb3pl
biBzcGVjaWZjYXRpb24gY2FuIGJlIGZvdW5kIGF0Ogo+IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNj
di1ub24taXNhL3Jpc2N2LWlvbW11L3JlbGVhc2VzL2Rvd25sb2FkL3YxLjAvcmlzY3YtaW9tbXUu
cGRmCj4KPiBBdCBhIGhpZ2gtbGV2ZWwsIHRoZSBSSVNDLVYgSU9NTVUgc3BlY2lmaWNhdGlvbiBk
ZWZpbmVzOgo+IDEpIE1lbW9yeS1tYXBwZWQgcHJvZ3JhbW1pbmcgaW50ZXJmYWNlCj4gICAgLSBN
YW5kYXRvcnkgYW5kIG9wdGlvbmFsIHJlZ2lzdGVycyBsYXlvdXQgYW5kIGRlc2NyaXB0aW9uLgo+
ICAgIC0gU29mdHdhcmUgZ3VpZGVsaW5lcyBmb3IgZGV2aWNlIGluaXRpYWxpemF0aW9uIGFuZCBj
YXBhYmlsaXRpZXMgZGlzY292ZXJ5Lgo+IDIpIEluLW1lbW9yeSBxdWV1ZSBpbnRlcmZhY2UKPiAg
ICAtIEEgY29tbWFuZC1xdWV1ZSB1c2VkIGJ5IHNvZnR3YXJlIHRvIHF1ZXVlIGNvbW1hbmRzIHRv
IHRoZSBJT01NVS4KPiAgICAtIEEgZmF1bHQvZXZlbnQgcXVldWUgdXNlZCB0byBicmluZyBmYXVs
dHMgYW5kIGV2ZW50cyB0byBzb2Z0d2FyZeKAmXMgYXR0ZW50aW9uLgo+ICAgIC0gQSBwYWdlLXJl
cXVlc3QgcXVldWUgdXNlZCB0byByZXBvcnQg4oCcUGFnZSBSZXF1ZXN04oCdIG1lc3NhZ2VzIHJl
Y2VpdmVkIGZyb20KPiAgICAgIFBDSWUgZGV2aWNlcy4KPiAgICAtIE1lc3NhZ2Utc2lnbmFsbGVk
IGFuZCB3aXJlLXNpZ25hbGVkIGludGVycnVwdCBtZWNoYW5pc20uCj4gMykgSW4tbWVtb3J5IGRh
dGEgc3RydWN0dXJlcwo+ICAgIC0gRGV2aWNlLWNvbnRleHQ6IHVzZWQgdG8gYXNzb2NpYXRlIGEg
ZGV2aWNlIHdpdGggYW4gYWRkcmVzcyBzcGFjZSBhbmQgdG8gaG9sZAo+ICAgICAgb3RoZXIgcGVy
LWRldmljZSBwYXJhbWV0ZXJzIHVzZWQgYnkgdGhlIElPTU1VIHRvIHBlcmZvcm0gYWRkcmVzcyB0
cmFuc2xhdGlvbnMuCj4gICAgLSBQcm9jZXNzLWNvbnRleHRzOiB1c2VkIHRvIGFzc29jaWF0ZSBh
IGRpZmZlcmVudCB2aXJ0dWFsIGFkZHJlc3Mgc3BhY2UgYmFzZWQgb24KPiAgICAgIGRldmljZSBw
cm92aWRlZCBwcm9jZXNzIGlkZW50aWZpY2F0aW9uIG51bWJlci4KPiAgICAtIE1TSSBwYWdlIHRh
YmxlIGNvbmZpZ3VyYXRpb24gdXNlZCB0byBkaXJlY3QgYW4gTVNJIHRvIGEgZ3Vlc3QgaW50ZXJy
dXB0IGZpbGUKPiAgICAgIGluIGFuIElNU0lDLiBUaGUgTVNJIHBhZ2UgdGFibGUgZm9ybWF0cyBh
cmUgZGVmaW5lZCBieSB0aGUgQWR2YW5jZWQgSW50ZXJydXB0Cj4gICAgICBBcmNoaXRlY3R1cmUg
c3BlY2lmaWNhdGlvbiBbMl0uCj4KPiBUaGlzIHNlcmllcyBpbnRyb2R1Y2VzIGNvbXBsZXRlIHNp
bmdsZS1sZXZlbCB0cmFuc2xhdGlvbiBzdXBwb3J0LCBpbmNsdWRpbmcgc2hhcmVkCj4gdmlydHVh
bCBhZGRyZXNzIChTVkEpLCBBVFMvUFJJIGludGVyZmFjZXMgaW4gdGhlIGtlcm5lbCBkcml2ZXIu
IFBhdGNoZXMgYWRkaW5nIE1TSQo+IGlkZW50aXR5IHJlbWFwcGluZyBhbmQgRy1TdGFnZSB0cmFu
c2xhdGlvbiAoR1BBIHRvIFNQQSkgYXJlIGFkZGVkIG9ubHkgdG8gZXhjZXJjaXNlCj4gaGFyZHdh
cmUgaW50ZXJmYWNlcywgdG8gYmUgY29tcGxlbWVudGVkIHdpdGggQUlBL0tWTSBiaW5kaW5ncyBp
biBmb2xsb3ctdXAgc2VyaWVzLgo+Cj4gVGhpcyBzZXJpZXMgaXMgYSBsb2dpY2FsIHJlZ3JvdXBp
bmcgb2Ygc2VyaWVzIG9mIGluY3JlbWVudGFsIHBhdGNoZXMgYmFzZWQgb24KPiBSSVNDLVYgSW50
ZXJuYXRpb25hbCBJT01NVSBUYXNrIEdyb3VwIGRpc2N1c3Npb25zIGFuZCBzcGVjaWZpY2F0aW9u
IGRldmVsb3BtZW50Cj4gcHJvY2Vzcy4gT3JpZ2luYWwgc2VyaWVzIGNhbiBiZSBmb3VuZCBhdCB0
aGUgbWFpbnRhaW5lcidzIHJlcG9zaXRvcnkgYnJhbmNoIFszXS4KPgo+IFRoZXNlIHBhdGNoZXMg
Y2FuIGFsc28gYmUgZm91bmQgaW4gdGhlIHJpc2N2X2lvbW11X3YxIGJyYW5jaCBhdDoKPiBodHRw
czovL2dpdGh1Yi5jb20vdGplem5hY2gvbGludXgvdHJlZS9yaXNjdl9pb21tdV92MQo+Cj4gVG8g
dGVzdCB0aGlzIHNlcmllcywgdXNlIFFFTVUvT3BlblNCSSB3aXRoIFJJU0MtViBJT01NVSBpbXBs
ZW1lbnRhdGlvbiBhdmFpbGFibGUgaW4KPiB0aGUgcmlzY3ZfaW9tbXVfdjEgYnJhbmNoIGF0Ogo+
IGh0dHBzOi8vZ2l0aHViLmNvbS90amV6bmFjaC9xZW11L3RyZWUvcmlzY3ZfaW9tbXVfdjEKPgo+
IFJlZmVyZW5jZXM6Cj4gWzFdIC0gaHR0cHM6Ly93aWtpLnJpc2N2Lm9yZy9kaXNwbGF5L0hPTUUv
U3BlY2lmaWNhdGlvbitTdGF0dXMKPiBbMl0gLSBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Yvcmlz
Y3YtYWlhL3JlbGVhc2VzL2Rvd25sb2FkLzEuMC9yaXNjdi1pbnRlcnJ1cHRzLTEuMC5wZGYKPiBb
M10gLSBodHRwczovL2dpdGh1Yi5jb20vdGplem5hY2gvcWVtdS90cmVlL3RqZXpuYWNoL3Jpc2N2
LWlvbW11LTIwMjMwNzE5Cj4KPgo+IEFudXAgUGF0ZWwgKDEpOgo+ICAgZHQtYmluZGluZ3M6IEFk
ZCBSSVNDLVYgSU9NTVUgYmluZGluZ3MKPgo+IFRvbWFzeiBKZXpuYWNoICgxMCk6Cj4gICBSSVND
LVY6IGRyaXZlcnMvaW9tbXU6IEFkZCBSSVNDLVYgSU9NTVUgLSBaaW9tbXUgc3VwcG9ydC4KPiAg
IFJJU0MtVjogYXJjaC9yaXNjdi9jb25maWc6IGVuYWJsZSBSSVNDLVYgSU9NTVUgc3VwcG9ydAo+
ICAgTUFJTlRBSU5FUlM6IEFkZCBteXNlbGYgZm9yIFJJU0MtViBJT01NVSBkcml2ZXIKPiAgIFJJ
U0MtVjogZHJpdmVycy9pb21tdS9yaXNjdjogQWRkIHN5c2ZzIGludGVyZmFjZQo+ICAgUklTQy1W
OiBkcml2ZXJzL2lvbW11L3Jpc2N2OiBBZGQgY29tbWFuZCwgZmF1bHQsIHBhZ2UtcmVxIHF1ZXVl
cwo+ICAgUklTQy1WOiBkcml2ZXJzL2lvbW11L3Jpc2N2OiBBZGQgZGV2aWNlIGNvbnRleHQgc3Vw
cG9ydAo+ICAgUklTQy1WOiBkcml2ZXJzL2lvbW11L3Jpc2N2OiBBZGQgcGFnZSB0YWJsZSBzdXBw
b3J0Cj4gICBSSVNDLVY6IGRyaXZlcnMvaW9tbXUvcmlzY3Y6IEFkZCBTVkEgd2l0aCBQQVNJRC9B
VFMvUFJJIHN1cHBvcnQuCj4gICBSSVNDLVY6IGRyaXZlcnMvaW9tbXUvcmlzY3Y6IEFkZCBNU0kg
aWRlbnRpdHkgcmVtYXBwaW5nCj4gICBSSVNDLVY6IGRyaXZlcnMvaW9tbXUvcmlzY3Y6IEFkZCBH
LVN0YWdlIHRyYW5zbGF0aW9uIHN1cHBvcnQKPgo+ICAuLi4vYmluZGluZ3MvaW9tbXUvcmlzY3Ys
aW9tbXUueWFtbCAgICAgICAgICAgfCAgMTQ2ICsrCj4gIE1BSU5UQUlORVJTICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDcgKwo+ICBhcmNoL3Jpc2N2L2NvbmZpZ3MvZGVm
Y29uZmlnICAgICAgICAgICAgICAgICAgfCAgICAxICsKPiAgZHJpdmVycy9pb21tdS9LY29uZmln
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMSArCj4gIGRyaXZlcnMvaW9tbXUvTWFrZWZp
bGUgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDIgKy0KPiAgZHJpdmVycy9pb21tdS9pby1w
Z3RhYmxlLmMgICAgICAgICAgICAgICAgICAgIHwgICAgMyArCj4gIGRyaXZlcnMvaW9tbXUvcmlz
Y3YvS2NvbmZpZyAgICAgICAgICAgICAgICAgICB8ICAgMjIgKwo+ICBkcml2ZXJzL2lvbW11L3Jp
c2N2L01ha2VmaWxlICAgICAgICAgICAgICAgICAgfCAgICAxICsKPiAgZHJpdmVycy9pb21tdS9y
aXNjdi9pb19wZ3RhYmxlLmMgICAgICAgICAgICAgIHwgIDI2NiArKwo+ICBkcml2ZXJzL2lvbW11
L3Jpc2N2L2lvbW11LWJpdHMuaCAgICAgICAgICAgICAgfCAgNzA0ICsrKysrKwo+ICBkcml2ZXJz
L2lvbW11L3Jpc2N2L2lvbW11LXBjaS5jICAgICAgICAgICAgICAgfCAgMjA2ICsrCj4gIGRyaXZl
cnMvaW9tbXUvcmlzY3YvaW9tbXUtcGxhdGZvcm0uYyAgICAgICAgICB8ICAxNjAgKysKPiAgZHJp
dmVycy9pb21tdS9yaXNjdi9pb21tdS1zeXNmcy5jICAgICAgICAgICAgIHwgIDE4MyArKwo+ICBk
cml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMgICAgICAgICAgICAgICAgICAgfCAyMTMwICsrKysr
KysrKysrKysrKysrCj4gIGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuaCAgICAgICAgICAgICAg
ICAgICB8ICAxNjUgKysKPiAgaW5jbHVkZS9saW51eC9pby1wZ3RhYmxlLmggICAgICAgICAgICAg
ICAgICAgIHwgICAgMiArCj4gIDE2IGZpbGVzIGNoYW5nZWQsIDM5OTggaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2lvbW11L3Jpc2N2LGlvbW11LnlhbWwKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvaW9tbXUvcmlzY3YvS2NvbmZpZwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9pb21tdS9yaXNjdi9NYWtlZmlsZQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9pb21t
dS9yaXNjdi9pb19wZ3RhYmxlLmMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaW9tbXUv
cmlzY3YvaW9tbXUtYml0cy5oCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2lvbW11L3Jp
c2N2L2lvbW11LXBjaS5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2lvbW11L3Jpc2N2
L2lvbW11LXBsYXRmb3JtLmMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaW9tbXUvcmlz
Y3YvaW9tbXUtc3lzZnMuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9pb21tdS9yaXNj
di9pb21tdS5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11
LmgKPgo+IC0tCj4gMi4zNC4xCj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YKCkhpIFRvbWFzeiwKQ291bGQgSSBrbm93IGlmIHlvdSBoYXZl
IGEgcGxhbiBmb3IgdGhlIG5leHQgdmVyc2lvbiBhbmQgaWYgeW91IGhhdmUKYW55IGVzdGltYXRl
cyBmb3Igd2hlbiB0aGUgdjIgcGF0Y2ggd2lsbCBiZSByZWFkeT8gV2UgaGF2ZSBzb21lCnBhdGNo
ZXMgYmFzZWQgb24gdG9wIG9mIHlvdXIgb2xkIGltcGxlbWVudGF0aW9uLCBhbmQgaXQgd291bGQg
YmUgZ3JlYXQKaWYgd2UgY2FuIHJlYmFzZSB0aGVtIG9udG8geW91ciBuZXh0IHZlcnNpb24uIFRo
YW5rcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
