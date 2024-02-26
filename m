Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2B1C54E49
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Feb 2024 12:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XIwxDV8ePgwfKSKKEXuR0MqTkM83+RMfMCHs3/no8Cg=; b=aDos7vWLj6zo5q
	H+W0eV/1JY2ENrXmvImqAIOtO0w62xwelyeiwbkPwzcgpi9o8qYezoK5jRYepfG259l2lyKe2PU9R
	VY5fyZJZwzxrf3YXYIJOvddeqTr/3XhuDubAMpEJr2YjvwsqHBlA1FyKVhXp9TUHXknOK04dEXKva
	qBCFmX3ZGnq+O5xLVq9gH1fRQN8FY3q7k+NoYOTHxs8TmgnOOgb7Aqn9Gq/htg11z800/iWuB67pa
	vJmqyt305B1xpkuPzqpaisLMYCD5EZOiqh7k8Zy6plYbF24ZfKP5iJc+TJg61BPt7cb/WmD/JadeX
	EJ+Bb5wYNJh8S3k57bNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rea69-00000000Zq4-3LoA;
	Mon, 26 Feb 2024 12:28:45 +0000
Received: from mail-yw1-f179.google.com ([209.85.128.179])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rea5x-00000000Zk6-2dbq;
	Mon, 26 Feb 2024 12:28:35 +0000
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-608f5775ce0so7569577b3.0;
        Mon, 26 Feb 2024 04:28:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708950512; x=1709555312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IA4QNksb22erWBRN6uBbo69xHUrtQuWcgavfHO0o/70=;
        b=BjkpL3iLI6+UeUdUMBjhHW+61KHk17K8SKzFYzMjJYZ56Dcs058Q2ZuL4DkmogoyiC
         9yuXMlu4v3ftDfA+KRnlC3N440iVac/SY0sSRdrUMBxs3lilTrrqHlftQNp+AEUb8Ly3
         YCTKIBXf01iEefWJXpT0oIoP8oKMCBqjytwCAKGxBwGMMiamCkFyoLFAfwyO6uQXcsrx
         qkB0qgC6Z66Uh0KCSF7Zh3UddCpFyVQCDybW4yB/Z+Xl3q2ysDJVJv5kf0CCqVjGVTwe
         ywoGj5AzMdJlMDSqOtJXhtFj9b3Hi6KZJUsoUb3kkRSecTy3AMHbioDOeibsJX14n4xX
         yBig==
X-Forwarded-Encrypted: i=1; AJvYcCV4ty4THv6GD8sksyYYIRtkWEsrTedCvdYlJ0C7h0Pu4uEQyXCRXgTxb8Hu+Gocu5neUcraJMe8W5ClD/6VyDtw9hfOIu4r61z+irwo6Eg42+Dnlth3awb1jyPiS4GGA8/b5bcuqOKTXAtPxdPsUsjAXfyRMfY=
X-Gm-Message-State: AOJu0YwVedamyQJ46gD/PbwU7Jyy9NAjeXBMnfIj8kFmC2MIekXeGUOJ
	19j2iHyZeGd4OC96ds3/CeaiwlcVn4pno2QCATtuYARvDQHVcfuLy441W2FS9qM=
X-Google-Smtp-Source: AGHT+IGyGSk2j4/DJ2w2/2uPTKEIo9e6wWq/njzRyOGQU3Gtv8Q4R13+jLViKVK8wcIrCMH4oeBJkw==
X-Received: by 2002:a81:4946:0:b0:604:a9c2:2a17 with SMTP id w67-20020a814946000000b00604a9c22a17mr6109414ywa.45.1708950510350;
        Mon, 26 Feb 2024 04:28:30 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id i185-20020a8191c2000000b00607cd912a85sm1149559ywg.18.2024.02.26.04.28.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 04:28:30 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dcc73148611so3120210276.3;
        Mon, 26 Feb 2024 04:28:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWeFRBnDq9dmM9D2ZXI//0v+gY/sb94mkAX74oOq/Y7zqfdMTXKCfxBToxfjle7SDryWd4jyg3tRmVEUjceMDGB27+PN18Xij+/60fSqiz05BvsQJpStueSK+lCV1Ly/U14WwV4cRAMoSR0A10KLUbAfxrf+S8=
X-Received: by 2002:a25:ce11:0:b0:dc6:d7de:5b29 with SMTP id
 x17-20020a25ce11000000b00dc6d7de5b29mr4889354ybe.10.1708950510084; Mon, 26
 Feb 2024 04:28:30 -0800 (PST)
MIME-Version: 1.0
References: <20240222083946.3977135-1-peterlin@andestech.com> <20240222083946.3977135-10-peterlin@andestech.com>
In-Reply-To: <20240222083946.3977135-10-peterlin@andestech.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Feb 2024 13:28:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV7f_R-_OiP-18rQATVdnS-1yo_kT++O=e1KuUSfeiygw@mail.gmail.com>
Message-ID: <CAMuHMdV7f_R-_OiP-18rQATVdnS-1yo_kT++O=e1KuUSfeiygw@mail.gmail.com>
Subject: Re: [PATCH v9 09/10] riscv: dts: renesas: Add Andes PMU extension for r9a07g043f
To: Yu Chien Peter Lin <peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_042833_710823_592658BE 
X-CRM114-Status: GOOD (  14.57  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, unicorn_wang@outlook.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, jszhang@kernel.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, conor@kernel.org, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org, wefu@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBGZWIgMjIsIDIwMjQgYXQgOTo0MeKAr0FNIFl1IENoaWVuIFBldGVyIExpbgo8cGV0
ZXJsaW5AYW5kZXN0ZWNoLmNvbT4gd3JvdGU6Cj4geGFuZGVzcG11IHN0YW5kcyBmb3IgQW5kZXMg
UGVyZm9ybWFuY2UgTW9uaXRvciBVbml0IGV4dGVuc2lvbi4KPiBCYXNlZCBvbiB0aGUgYWRkZWQg
QW5kZXMgUE1VIElTQSBzdHJpbmcsIHRoZSBTQkkgUE1VIGRyaXZlcgo+IHdpbGwgbWFrZSB1c2Ug
b2YgdGhlIG5vbi1zdGFuZGFyZCBpcnEgc291cmNlLgo+Cj4gU2lnbmVkLW9mZi1ieTogWXUgQ2hp
ZW4gUGV0ZXIgTGluIDxwZXRlcmxpbkBhbmRlc3RlY2guY29tPgo+IFJldmlld2VkLWJ5OiBHZWVy
dCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgo+IFJldmlld2VkLWJ5OiBM
YWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4g
VGVzdGVkLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVu
ZXNhcy5jb20+Cj4gQWNrZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hp
cC5jb20+Cj4gLS0tCj4gQ2hhbmdlcyB2MSAtPiB2MjoKPiAgIC0gTmV3IHBhdGNoCj4gQ2hhbmdl
cyB2MiAtPiB2MzoKPiAgIC0gTm8gY2hhbmdlCj4gQ2hhbmdlcyB2MyAtPiB2NDoKPiAgIC0gTm8g
Y2hhbmdlCj4gQ2hhbmdlcyB2NCAtPiB2NToKPiAgIC0gSW5jbHVkZSBHZWVydCdzIFJldmlld2Vk
LWJ5Cj4gICAtIEluY2x1ZGUgUHJhYmhha2FyJ3MgUmV2aWV3ZWQvVGVzdGVkLWJ5Cj4gQ2hhbmdl
cyB2NSAtPiB2NjoKPiAgIC0gSW5jbHVkZSBDb25vcidzIEFja2VkLWJ5Cj4gQ2hhbmdlcyB2NiAt
PiB2NzoKPiAgIC0gTm8gY2hhbmdlCj4gQ2hhbmdlcyB2NyAtPiB2ODoKPiAgIC0gTm8gY2hhbmdl
Cj4gQ2hhbmdlcyB2OCAtPiB2OToKPiAgIC0gTm8gY2hhbmdlCgpBY2tlZC1ieTogR2VlcnQgVXl0
dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4Kc28gUGFsbWVyIGNhbiBwaWNrIGl0
IHVwIHdpdGggdGhlIHJlc3Qgb2YgdGhlIHNlcmllcwoodGhlIFJlbmVzYXMgdHJlZSBtZXJnZSB3
aW5kb3cgZm9yIHY2LjkgaGFzIGNsb3NlZCkKCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAg
ICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBs
b3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJz
b25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBh
IGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAi
cHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
