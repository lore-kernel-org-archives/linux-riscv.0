Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A142C61D97
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 17:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v14pzS6C+kJpEhpbDDz6ZNXnIwFOciinKuDhaov+eLs=; b=JZ8aERsg+dFZU8
	UGTiJfeJfWNG3NdapC2eZ+a1A+7tx+JOBBmmiEd0rvgJus8AZgCFlJnXJEMQT236Fdha3z/Jt2k+p
	y0VstexNDS7xY6FPWXnP3oF00CQWzquVExUNvGqMzCXZT2lpbBSZhvmS8+MkOnsCgB+b9B9cUWS3+
	PXQLLaO7PmHmJeswOgvVFhPKpMF9Q7F2ejA1RHE39lUAv8H+VOt1rvgyAMUGcKQCSCaz3qMJFmIPK
	rQ02XQJ6dnzovdH9bnI5q/3zqmlgcOhqkF0pReu6nE81OC77jKqtqyDjSJmP4CCBQlA/cIG+wc+1H
	2ry3k2QcpRp60l96IXaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5rJ5-002j7G-0o;
	Wed, 22 Nov 2023 17:46:35 +0000
Received: from mail-yb1-f182.google.com ([209.85.219.182])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5qDQ-002VO5-0I;
	Wed, 22 Nov 2023 16:36:43 +0000
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-da3b4b7c6bdso6832836276.2;
        Wed, 22 Nov 2023 08:36:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700670999; x=1701275799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YnNltyNH2Qapz/Qt/SgTE3LNVbUWrueMgIGKLwuGujM=;
        b=wD6A/2ewjR7zWxZqwALpF7riJPjiA2nxScvzDtyMfhjcL0WaQrr5R0qJ22EXNbyqbD
         tOzCm6c5Yfpesu2Q0oSnsQVLytGNW7e91JJ4JVK2DSDbgTrvYQKOBI40zNta8zVDHiY1
         1ITSRPvBpNAn1XB6FYMpJQN8TxEK6UVCFR40/78A6cW8pmgCba0itbvT2fbQPV5RRR1e
         sbIY0zgI4hGNbLEz+6KtcpO64fu6AJOHo0Wupvp45ayXW14leOdJJ4UCZDX21uqiUVEU
         EZ3rnxtFiqYIm13l9NIfNoZ9q/dBSXpf73YJSJDMpClXdbsGU2p3Xfli0/Dbf1Gj6rgX
         THgA==
X-Gm-Message-State: AOJu0YzDspRi36gV0ueZgxutz07xgyNgWQKWIva6ENrAXYOKEA6JejYf
	5Y4FC3rrXjljz1FCRZxFMBMs6iEY9mS1LA==
X-Google-Smtp-Source: AGHT+IEtat1g4d6DfbRRdiw+tDc68ZcPruPScIe6eYjbiz8n6qHy1QvckrP1zHa6dezf87xIjyrHCg==
X-Received: by 2002:a25:8748:0:b0:d91:b6e5:54dd with SMTP id e8-20020a258748000000b00d91b6e554ddmr2674970ybn.3.1700670998799;
        Wed, 22 Nov 2023 08:36:38 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 67-20020a250646000000b00d0b0bbe574asm1463592ybg.44.2023.11.22.08.36.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 08:36:38 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5c85e8fdd2dso55845117b3.2;
        Wed, 22 Nov 2023 08:36:38 -0800 (PST)
X-Received: by 2002:a0d:d78f:0:b0:5a8:22b5:399c with SMTP id
 z137-20020a0dd78f000000b005a822b5399cmr3089413ywd.24.1700670998325; Wed, 22
 Nov 2023 08:36:38 -0800 (PST)
MIME-Version: 1.0
References: <20231122121235.827122-1-peterlin@andestech.com> <20231122121235.827122-6-peterlin@andestech.com>
In-Reply-To: <20231122121235.827122-6-peterlin@andestech.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Nov 2023 17:36:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVL9_VQ7e7-Cr7vcFWqpCTeptczZmgWN4seENcJKTi0eQ@mail.gmail.com>
Message-ID: <CAMuHMdVL9_VQ7e7-Cr7vcFWqpCTeptczZmgWN4seENcJKTi0eQ@mail.gmail.com>
Subject: Re: [PATCH v4 05/13] riscv: dts: renesas: r9a07g043f: Update
 compatible string to use Andes INTC
To: Yu Chien Peter Lin <peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_083640_144769_1361E007 
X-CRM114-Status: GOOD (  12.91  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, jszhang@kernel.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, krzysztof.kozlowski+dt@linaro.org, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, conor@kernel.org, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBOb3YgMjIsIDIwMjMgYXQgMToxNuKAr1BNIFl1IENoaWVuIFBldGVyIExpbgo8cGV0
ZXJsaW5AYW5kZXN0ZWNoLmNvbT4gd3JvdGU6Cj4gVGhlIEFuZGVzIGhhcnQtbGV2ZWwgaW50ZXJy
dXB0IGNvbnRyb2xsZXIgKEFuZGVzIElOVEMpIGFsbG93cyBBWDQ1TVAKPiBjb3JlcyB0byBoYW5k
bGUgY3VzdG9tIGxvY2FsIGludGVycnVwdHMsIHN1Y2ggYXMgdGhlIHBlcmZvcm1hbmNlCj4gY291
bnRlciBvdmVyZmxvdyBpbnRlcnJ1cHQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBZdSBDaGllbiBQZXRl
ciBMaW4gPHBldGVybGluQGFuZGVzdGVjaC5jb20+CgpSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVy
aG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KCkdye29ldGplLGVldGluZ31zLAoKICAg
ICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhl
cmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJ
biBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15
c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0
IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
