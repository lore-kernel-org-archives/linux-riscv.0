Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BD5C7EE2E
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 08:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w6zUGG59Z8xvAG0DI5PlkwdE767NpMzs2YFKDZIapyY=; b=IfiCha7ITMJl0k
	OkcWPpZf/gLJjJzeaY9Y2jss8l0QX7tVcT4mu2KGoKFbYTPpocRFBaSfeSFYNro/QhgV2yjwitmgA
	U8aV586TORmNZPkCpD1c4GCZooGiyjsvAdn+cAWlGFrQzDCwBvPSCQhR9kzJ9KAuOyrsJo45uPfPd
	dr7SQSzKptqVQ1+LI1r+fx83ukwT7ER0g+57Lfq1WdoCS4u5sg+Vr589Qrd9HcE4aMHqa6UHHTOyt
	nPd4wm6r2F6nnPoyGvOO0DRtwDq+6YdXwVaref06WV9TXyl6HLVsTnBFMEku/KQuVpPebbTw9Y+IY
	TH6wRI9M49ecgDa0hyaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8ck9-0034jX-1b;
	Mon, 12 Jun 2023 08:17:41 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8ck5-0034g7-0n;
	Mon, 12 Jun 2023 08:17:38 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-51480d3e161so6019030a12.3;
        Mon, 12 Jun 2023 01:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686557852; x=1689149852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6RgjaXpEXsHKymgoZwVAer6HS1GkgWzeejMdXZmBJCA=;
        b=feZKdABYE4vr0/NYmcc9gHJ+PR5oKfdKIGeOnjty5TMRvE8Kf3x/25BlUC/YevRf3A
         jpSTRgRNFWCSTB2nGom8Azd3j5v4iuDtw1kwHFypuv+ZQCQDj4Um3K+Kc/68sjdXlIQ3
         +C8p/IFKrHF1iNClgAlJgppEO2YQXT8Jcemow3vQ4SZ1CRtC4sV1dbvNGTqihj8PVCtO
         djckobs1jZL6CMyhDqol7VJBSTlig2FFj87b2+XaSY9L7nwnZXNvI+/LN0yENHERKebe
         JXYAVYJjDLqFNxUj4dBY05LSW9N/atu3TUJeNY3llYeCmiivAGMF/gdklFewXBdvVUs7
         e2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686557852; x=1689149852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6RgjaXpEXsHKymgoZwVAer6HS1GkgWzeejMdXZmBJCA=;
        b=HV6geYtbKRmYjril5W/cwOCUttr3vLtXytohAO5k1XAlOmfjgw593SJtZcR7J/iSWj
         9uYFE0OpzzxDBUHGwmn/aP95t5azZMHzdc9kG97nORXIAFu1tx8UARPyDBM/2gBD978R
         MSJu/LJYt5EbIdF6BQu86V5OH4nzzI/yyRTcIzWTiKsGmczCeG/sCoI4/mlNUvwqOJUX
         m1X8UpR4sBsDczl7sIAwLWzovBvzPXS/AlWa65NbUl/yCC++3Jme5GVZaTg+oD55qlLT
         CMbacUvTf3ceBkXHkoFR4DfpxBE1+SJvS4e4sA6utMBOr9PajSPbFiKnLJTEOUINgQX4
         MJqQ==
X-Gm-Message-State: AC+VfDxjmil+YqFCVosmd3pmQ1/dKrVeKYH5HNXwUfbZ8C7Ddy4qI0u4
	gYxZilf2fOULR3RaWNy3prw+0maMuy6g+QPLPSc=
X-Google-Smtp-Source: ACHHUZ7FCeE2TU5RO0p4ZuTCrHCZsjmIYAyrRLpmWVGZEiXpCqk8v7qvN+gL76ATcUoQUnkiopkcmT1f+cSgMJTc7b4=
X-Received: by 2002:a17:907:9307:b0:974:2169:5f81 with SMTP id
 bu7-20020a170907930700b0097421695f81mr8955047ejc.22.1686557851593; Mon, 12
 Jun 2023 01:17:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230612063429.3343061-1-bigunclemax@gmail.com>
 <20230612063429.3343061-4-bigunclemax@gmail.com> <20230612-wriggle-remindful-89d5105c94ee@wendy>
In-Reply-To: <20230612-wriggle-remindful-89d5105c94ee@wendy>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Mon, 12 Jun 2023 11:17:20 +0300
Message-ID: <CALHCpMjxboLn2eTjOJkE2JAzH3S8OB3v9fWqDOdeipAmLvLx2Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] riscv: dts: allwinner: d1: Add thermal sensor and
 thermal zone
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-kernel@vger.kernel.org, Vasily Khoruzhick <anarsoul@gmail.com>, 
	Yangtao Li <tiny.windzz@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_011737_285215_10B1F077 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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

SGksIENvbm9yCgrQv9C9LCAxMiDQuNGO0L0uIDIwMjPigK/Qsy4g0LIgMTA6NTUsIENvbm9yIERv
b2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+OgoKLi4uCgo+IFRoZSBSSVNDLVYgcGF0
Y2h3b3JrIGF1dG9tYXRpb24gaXMgY29tcGxhaW5pbmcgYWJvdXQgdGhpcyBwYXRjaCB3aGlsZQo+
IHJ1bm5pbmcgZHRic19jaGVjazoKPiBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW4y
MGktZDFzLW1hbmdvcGktbXEuZHRiOiB0aGVybWFsLXpvbmVzOiBjcHUtdGhlcm1hbDogJ3RyaXBz
JyBpcyBhIHJlcXVpcmVkIHByb3BlcnR5Cj4gICAgICAgICBGcm9tIHNjaGVtYTogRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RoZXJtYWwvdGhlcm1hbC16b25lcy55YW1sCgpJIGRp
ZG4ndCBhZGQgJ3RyaXBzJyBiZWNhdXNlIEknbSBub3Qgc3VyZSBpZiB0aGV5IHNob3VsZCBiZSB0
aGUgc2FtZQpmb3IgdGhlIEQxIGFuZCB0aGUgVDExM3MuCk1heWJlIGl0J3MgYmV0dGVyIHRvIGRy
b3AgJ3RoZXJtYWwtem9uZXMnIGZyb20gdGhpcyBwYXRjaCBhbmQgYWRkIHRoZW0KbGF0ZXIgaW4g
c2VwYXJhdGUgcGF0Y2hlcwpmb3IgVDExM3MgYW5kIEQxPwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
