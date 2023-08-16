Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD98C0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 02:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZuxxDNO2Z509/CgbAgiE/Q596vFzv9dPpnQ0fFHLwF8=; b=2Ay44VseuTTarh
	v3SOT15uV5H/2iYVzaO7z8b23a183ZXR+E5yhogdA+//SD/W5Ax6GXjMyfAN4UolgeoER6hgga1f9
	khk0ka9k7U+R0yq/nQEQtb33JWTSX9o5agkcTaCcAKPI3oByWeqcnc/3N+LBysQCpaTyaZylqN+E6
	93dijiJgDgJo4aqNqB/MTh1Fpwfv+vGbq0NJKNI6VDHlmJAoSy9h9rtAYVgL1NdiZhXWEiSpg5Il2
	koTBiA/iHKzdyX1TppPUxofGvCWDDGyS7Ez1+C/Hl3zMK9zouJfow0eeMPScsEHJ/rgFTlKUPiMx3
	g/wTvx9M1+Bzlea2rQDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qW5wb-002zCu-2j;
	Wed, 16 Aug 2023 02:07:33 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qW5wY-002zBh-0U
	for linux-riscv@lists.infradead.org;
	Wed, 16 Aug 2023 02:07:31 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1bdca7cc28dso31613695ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 15 Aug 2023 19:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692151648; x=1692756448;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1cgPRSiv90OT3/SJL8ZMyRGl4jaRnBiBcYOX7OaylDE=;
        b=sQMCdgdwxL3T4OXi4BlV/8FePNPTCIivYKVkWn7lRRSmnv5c9qZy5fs29K/KOgn29Y
         O8HjNk71YBIgx74M3jMGU3NLOjIFS9rRDybcVMBz2bJESPp8ZeMJf139+YR9x/hnzLdK
         D0Gv8oY475Le4AEIkHqSSKHQQo7i5EhKKU06ctzgup9rZYddS9+agRyqLXUdQKd3X3+P
         K3GWm8qR+KCTSWmkUrwFHmWiaduwlS7z6JNuRPhqqDNHTDMq3oYDQ2T7uc9wG8tD2bZV
         IWvkM3M+XBkk+S50u1wastmv7g7ljregVsfk60vECo7OjFjmkfrl3z5hhUIg5CxY2zhR
         0drw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692151648; x=1692756448;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1cgPRSiv90OT3/SJL8ZMyRGl4jaRnBiBcYOX7OaylDE=;
        b=Eb19cNKLuwMWrT29M2qssy7T4o6p/MWAGrILCeNUm5na7risMqI0MujOjR6SEoJ55/
         RU2Iy5NqJxurJyM4z/nGIU2oyZ7dS1n4ZgIafc5qh83+y2UcFnCxEXDFhIr8g2rkq3zs
         1M7C+d5xDJSgKRRPW1olMSL1otsUB7XPxH3prEYZwSJV7KIY8asjOloeXqg5NawyxVBo
         PXy1MeKxgvyRjimKY00jyHJEgrez+Rh3/MtZDfiUS4DqiFNTg/rzFz7AHSQdrjdHOatZ
         +lBWDJuVJnFILLoOvA3fv39+o0xpv/IvNGcQv3vRhTT646jzQbbf/y4Uop7P5YE+C2a2
         T/Lg==
X-Gm-Message-State: AOJu0Yy0NpSJobRN0cqUo+61GAr3TB1hmTCtp9f3Igb/en60Wt9fLPnx
	h4iitjROoE5G56Cdckykr63DWQ==
X-Google-Smtp-Source: AGHT+IFCPpYmyWaib0MQfDL563rBcVuQf0cRysHOx8FVJ+qFoWVHApR2PRs6Is19nR5cTTuzLoiwuw==
X-Received: by 2002:a17:903:2796:b0:1b8:8223:8bdd with SMTP id jw22-20020a170903279600b001b882238bddmr692922plb.59.1692151647664;
        Tue, 15 Aug 2023 19:07:27 -0700 (PDT)
Received: from leoy-huanghe.lan ([150.230.248.162])
        by smtp.gmail.com with ESMTPSA id l2-20020a170902f68200b001b8943b37a5sm11673061plg.24.2023.08.15.19.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 19:07:27 -0700 (PDT)
Date: Wed, 16 Aug 2023 10:07:15 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Ian Rogers <irogers@google.com>, John Garry <john.g.garry@oracle.com>,
	Will Deacon <will@kernel.org>, James Clark <james.clark@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ming Wang <wangming01@loongson.cn>, Eric Lin <eric.lin@sifive.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	Sandipan Das <sandipan.das@amd.com>,
	Ivan Babrou <ivan@cloudflare.com>,
	Fangrui Song <maskray@google.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/6] perf parse-regs: Refactor architecture functions
Message-ID: <20230816020715.GA135657@leoy-huanghe.lan>
References: <20230606014559.21783-1-leo.yan@linaro.org>
 <CAP-5=fV1m440mKc0R=m5C4N2NtoiixchtnpX2eR3PA_5hXbqEQ@mail.gmail.com>
 <ZNvCxM/ULdUfzHtR@kernel.org>
 <ZNvHx+KxIL6JzEl/@kernel.org>
 <ZNvJdsVmmAWLmfH6@kernel.org>
 <ZNvKjeFkXY8ezf9e@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZNvKjeFkXY8ezf9e@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_190730_191626_38BAFBA3 
X-CRM114-Status: GOOD (  19.43  )
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

T24gVHVlLCBBdWcgMTUsIDIwMjMgYXQgMDM6NTc6MTdQTSAtMDMwMCwgQXJuYWxkbyBDYXJ2YWxo
byBkZSBNZWxvIHdyb3RlOgo+IEVtIFR1ZSwgQXVnIDE1LCAyMDIzIGF0IDAzOjUyOjM4UE0gLTAz
MDAsIEFybmFsZG8gQ2FydmFsaG8gZGUgTWVsbyBlc2NyZXZldToKPiA+IEVtIFR1ZSwgQXVnIDE1
LCAyMDIzIGF0IDAzOjQ1OjI3UE0gLTAzMDAsIEFybmFsZG8gQ2FydmFsaG8gZGUgTWVsbyBlc2Ny
ZXZldToKPiA+ID4gPiBBZ3JlZWQsIGFwcGxpZWQgdG8gcGVyZi10b29scy1uZXh0LCBzb3JyeSBm
b3IgdGhlIGRlbGF5Lgo+ID4gPiAKPiA+ID4gSGFkIHRvIGFkZCB0aGlzIHRvIG1ha2UgJ3BlcmYg
dGVzdCBweXRob24nIHRvIHdvcmsuIFBsZWFzZSBydW4gJ3BlcmYKPiA+ID4gdGVzdCcgYmVmb3Jl
IHNlbmRpbmcgcGF0Y2hlcy4KPiA+IAo+ID4gT25lIG1vcmUsIHBsZWFzZSBhbHNvIGRvIGEgJ21h
a2UgLUMgdG9vbHMvcGVyZiBidWlsZC10ZXN0Jywgd2l0aCBpdCBJCj4gPiBjYXVnaHQgdGhpczoK
PiA+IAo+ID4gICAgICAgICAgbWFrZV9ub19saWJ1bndpbmRfTzogY2QgLiAmJiBtYWtlIE5PX0xJ
QlVOV0lORD0xIEZFQVRVUkVTX0RVTVA9L3Zhci9ob21lL2FjbWUvZ2l0L3BlcmYtdG9vbHMtbmV4
dC90b29scy9wZXJmL0JVSUxEX1RFU1RfRkVBVFVSRV9EVU1QIC1qMzIgTz0vdG1wL3RtcC55ZUVH
eVFxMkhSIERFU1RESVI9L3RtcC90bXAuSVRnb08xNmpqSAo+ID4gY2QgLiAmJiBtYWtlIE5PX0xJ
QlVOV0lORD0xIEZFQVRVUkVTX0RVTVA9L3Zhci9ob21lL2FjbWUvZ2l0L3BlcmYtdG9vbHMtbmV4
dC90b29scy9wZXJmL0JVSUxEX1RFU1RfRkVBVFVSRV9EVU1QIC1qMzIgTz0vdG1wL3RtcC55ZUVH
eVFxMkhSIERFU1RESVI9L3RtcC90bXAuSVRnb08xNmpqSAo+IAo+ICsjaW5jbHVkZSAidXRpbC9l
bnYuaCIKPiAKPiBBcyBub3cgd2UgbmVlZCBpdCBmb3IgcGVyZl9lbnZfX2FyY2godWktPm1hY2hp
bmUtPmVudikKClNvcnJ5IGZvciBpbmNvbnZlbmllbmNlLgoKSSBzYXcgdGhpcyBwYXRjaCBzZXJp
ZXMgaGFzIGJlZW4gcGlja2VkIGludG8gdGhlIGJyYW5jaDoKaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYWNtZS9saW51eC5naXQvbG9nLz9oPXRtcC5wZXJm
LXRvb2xzLW5leHQKCklmIHdhbnQgbWUgdG8gZm9sbG93IHVwLCBsZXQgbWUga25vdy4gIFRoYW5r
IHlvdSEKCj4gPiAgIENDICAgICAgL3RtcC90bXAueWVFR3lRcTJIUi91dGlsL2V4cHItZmxleC5v
Cj4gPiB1dGlsL3Vud2luZC1saWJkdy5jOiBJbiBmdW5jdGlvbiDigJhtZW1vcnlfcmVhZOKAmToK
PiA+IHV0aWwvdW53aW5kLWxpYmR3LmM6MTczOjI4OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRp
b24gb2YgZnVuY3Rpb24g4oCYcGVyZl9lbnZfX2FyY2jigJkgWy1XZXJyb3I9aW1wbGljaXQtZnVu
Y3Rpb24tZGVjbGFyYXRpb25dCj4gPiAgIDE3MyB8ICAgICAgICAgY29uc3QgY2hhciAqYXJjaCA9
IHBlcmZfZW52X19hcmNoKHVpLT5tYWNoaW5lLT5lbnYpOwo+ID4gICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fgo+ID4gdXRpbC91bndpbmQtbGliZHcuYzox
NzM6Mjg6IGVycm9yOiBpbml0aWFsaXphdGlvbiBvZiDigJhjb25zdCBjaGFyICrigJkgZnJvbSDi
gJhpbnTigJkgbWFrZXMgcG9pbnRlciBmcm9tIGludGVnZXIgd2l0aG91dCBhIGNhc3QgWy1XZXJy
b3I9aW50LWNvbnZlcnNpb25dCj4gPiB1dGlsL3Vud2luZC1saWJkdy5jOiBJbiBmdW5jdGlvbiDi
gJh1bndpbmRfX2dldF9lbnRyaWVz4oCZOgo+ID4gdXRpbC91bndpbmQtbGliZHcuYzoyNTg6Mjg6
IGVycm9yOiBpbml0aWFsaXphdGlvbiBvZiDigJhjb25zdCBjaGFyICrigJkgZnJvbSDigJhpbnTi
gJkgbWFrZXMgcG9pbnRlciBmcm9tIGludGVnZXIgd2l0aG91dCBhIGNhc3QgWy1XZXJyb3I9aW50
LWNvbnZlcnNpb25dCj4gPiAgIDI1OCB8ICAgICAgICAgY29uc3QgY2hhciAqYXJjaCA9IHBlcmZf
ZW52X19hcmNoKHVpX2J1Zi5tYWNoaW5lLT5lbnYpOwo+ID4gICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fgo+ID4gY2MxOiBhbGwgd2FybmluZ3MgYmVpbmcg
dHJlYXRlZCBhcyBlcnJvcnMKPiA+IG1ha2VbNl06ICoqKiBbL3Zhci9ob21lL2FjbWUvZ2l0L3Bl
cmYtdG9vbHMtbmV4dC90b29scy9idWlsZC9NYWtlZmlsZS5idWlsZDo5ODogL3RtcC90bXAueWVF
R3lRcTJIUi91dGlsL3Vud2luZC1saWJkdy5vXSBFcnJvciAxCj4gPiBtYWtlWzZdOiAqKiogV2Fp
dGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLgo+ID4gbWFrZVs1XTogKioqIFsvdmFyL2hvbWUv
YWNtZS9naXQvcGVyZi10b29scy1uZXh0L3Rvb2xzL2J1aWxkL01ha2VmaWxlLmJ1aWxkOjE1MDog
dXRpbF0gRXJyb3IgMgo+ID4gbWFrZVs0XTogKioqIFtNYWtlZmlsZS5wZXJmOjY2MjogL3RtcC90
bXAueWVFR3lRcTJIUi9wZXJmLWluLm9dIEVycm9yIDIKPiA+IG1ha2VbNF06ICoqKiBXYWl0aW5n
IGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uCj4gPiAgIENDICAgICAgL3RtcC90bXAueWVFR3lRcTJI
Ui9wbXUtZXZlbnRzL3BtdS1ldmVudHMubwo+ID4gICBMRCAgICAgIC90bXAvdG1wLnllRUd5UXEy
SFIvcG11LWV2ZW50cy9wbXUtZXZlbnRzLWluLm8KPiA+IG1ha2VbM106ICoqKiBbTWFrZWZpbGUu
cGVyZjoyMzg6IHN1Yi1tYWtlXSBFcnJvciAyCj4gPiBtYWtlWzJdOiAqKiogW01ha2VmaWxlOjcw
OiBhbGxdIEVycm9yIDIKPiA+IG1ha2VbMV06ICoqKiBbdGVzdHMvbWFrZTozMzc6IG1ha2Vfbm9f
bGlidW53aW5kX09dIEVycm9yIDEKPiA+IG1ha2U6ICoqKiBbTWFrZWZpbGU6MTAzOiBidWlsZC10
ZXN0XSBFcnJvciAyCj4gPiBtYWtlOiBMZWF2aW5nIGRpcmVjdG9yeSAnL3Zhci9ob21lL2FjbWUv
Z2l0L3BlcmYtdG9vbHMtbmV4dC90b29scy9wZXJmJwo+ID4gCj4gPiByZWFsCTFtMjkuNzg0cwo+
ID4gdXNlcgkxMG00MS41OTdzCj4gPiBzeXMJMm01NS45NDhzCj4gPiDirKJbYWNtZUB0b29sYm94
IHBlcmYtdG9vbHMtbmV4dF0kCj4gPiAKPiA+IEknbSB0cnlpbmcgdG8gZml4Cj4gCj4gLS0gCj4g
Cj4gLSBBcm5hbGRvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
