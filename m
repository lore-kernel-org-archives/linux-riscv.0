Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE2C606A321
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 03:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MJN8+6Nv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=HciW3Pjw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GdVm5mfS4/+xYxWLCYvlzWNs5MZWEmI9MMuTu6p70KI=; b=MJN8+6NvAXaNiGA0D5tLwXtANC
	nM3bcCpEKRuIMgl3rvARQghVYeK4Uf9azD3jICgGlvZdyNnDURYw5+2G96W6p5r+KUNJ4IZewQZcR
	VgW3ZIA0tCa5dfNkmLeNq8jcMl0PI40SmfwE7th94R0vLquDUZcpZo4U7XDP2TpCuFwOuWIcKtFcT
	BeH2q2p6pobCoWQpCmcoJqrKhMZVs/WSFW5RQX1oR4v9sCHgWzzpJO88iIP6ztTETqww3uLAHIW4j
	0UryvL8eDxobaolNXJX2vJuUA2Qije/kqhBbF8z2LPvJ+3xZY8rmjzkp/pmj6Yo901Xb9f/wByQQx
	v4QNYcPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcDY-00000002EDl-3hGi;
	Tue, 10 Nov 2026 03:08:16 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcDW-00000002EDJ-2d3e
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 03:08:15 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-1b244fb7fffso1973296c88.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 19:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1794280093; x=1794884893; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kxXrVe4VYlIQzW68nXA3FT5khD/dasufUzEWUgRYIzU=;
        b=HciW3PjwGujCjTe7n0GnXNCakXpgTAUJwEg7qT+lZCLS7AHyiuGXNsq1dhh2z05SQO
         U1MP75+r/HglGp3xR/6qP27GXr2vFj/Md7qMfTero4Zvfn0EQJ/oEZ7gzI77PAi30MPc
         GT4gA/j4nlliVzWojq9IVdUaTLNPFbZ7H2mQWgnZRNnQB+d9PpieuoZ2CHTlQU9uz8pG
         Kt4vQ4cKgbr1uTJxUtWWZnwh2//yzkCn5en1wz95Mt3/0B+wwy7DrGHkmFyPbkK9j8vv
         qZiy+T6SiZQ9cnBrN7MCiylGJYa98O8hs30yz7/Cy0MWRLsU3AJKwd6qm/e5a4jNfO5H
         aC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280093; x=1794884893;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kxXrVe4VYlIQzW68nXA3FT5khD/dasufUzEWUgRYIzU=;
        b=braTfkyT/3hWVFzlZdodQBcY+zui/jqOHhhXpPH2rMO6CTBdFbXxK923q5FEOUJ/YA
         QbS17sVetvxbE2wRv1RknYAb6qUnqSduaK7O0gTgQWknDHF2jD8/j5UNkM/QqBKjOG9D
         3N01m/jUUNZ3NUB3aOexo/c3f/OxlRHVbTG+nyIutFLJ33Dt4fpdz4qmMj709b7Y+OG1
         N3SGa5kQfBMSGQn2ulLadvDGDKvlUHxc8eibeM13KIiR8T6SuTOZazUHsYHwQ/536qF4
         GJ7gfvad++RHPGO0Z7RgD0/QR7hbZF49lGx8DxikjjayiaOpDcavzXk5esZFzd4m90nX
         ohUA==
X-Forwarded-Encrypted: i=1; AL+hErEB+y1lilxlVOjpU7aIBRBpi+p5bjeRa30pDAdVJz8LjeEf4wNLxLga2tcDgJaS37ZX/7VnTlaRqKkA1Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z9jGTbNbEG5t/ZZzk0mkmd066e4IA/VS2adQwyW6womMjlakg7q
	4t5o0/xC16kWz/2lN8g8vr0YqnQYOg6nwNE3XjZXyRoUKQ6RzCPHDD4xAq5jpdzKE+A=
X-Gm-Gg: AYBFou3ikwNlB7dwETaSf+Ncqy9ZKWjAKMmeFQPtWBh45k/Ij/Ou1TGBFWYVO6mkWE7
	w6COEQSnBJlTaCGYRQuPws93ZI+XU3+vSRx8zyanMtnY5eXd2yyIU12Jq1T+B7vcdR0t9Gib0j+
	pww5ZL+PZG2N+qHKda1dx5ATAhPWz+wmDX2ovleonmmrV1pAPI15tBGLUulsAFQRmOwY8ndLwy/
	HepqWNmFldFblRatu0g3Wztl6HDpC9KAWSOBAqWeSD/r1EZmERtvWoXlT90l19UzDsim6JUrWKP
	WXR+kvitrhZugFAiXje6w2q30Zh2bh+qBjBi1eEWQtQgcTe0xpjUI+epS9QIo4LN4UFZOmkDl4w
	kQAqMfeKEbPNvf+cD1DBaKgOKJoReChgIcxeVcmDdxaIvOFGXNoFGPRjThBKifOwgiqpitCyTCY
	yG3nvTgC+jGjFiRLpRZ4fcjYDe+6wN7zBVndeX8o/7YiN4+fBy5IfzgSeX7lJGie/6nQKT55m4D
	nzSF7eZQGO/vbKFrYTLaB0LQpRdko8eYl8WNPlRCYYVPmP0E+CiivTTpkN7ieDcOb31JWGdaeHa
	MVhUYALWA3t5615FFd31wJizE/SDh+O+qF4woFzlYKda0tueplWfSxpCf9JytxR6KA==
X-Received: by 2002:a05:7022:458b:b0:1b2:4871:b1f7 with SMTP id a92af1059eb24-1b3b602aee6mr2497518c88.39.1794280093242;
        Mon, 09 Nov 2026 19:08:13 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b7ba88sm3117480c88.22.2026.11.09.19.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:08:12 -0800 (PST)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Cc: Leo Yu-Chi Liang <leo.liang@sifive.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>,
	Anup Patel <anup.patel@oss.qualcomm.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Mayuresh Chitale <mchitale@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Sunil V L <sunilvl@oss.qualcomm.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zane Leung <liangzhen@linux.spacemit.com>
Subject: Re: [PATCH v6 02/14] hwtracing: gtrace: Initial implementation of gtrace framework
Date: Mon,  9 Nov 2026 19:08:07 -0800
Message-ID: <20261110030809.2405947-1-leo.liang@sifive.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261001052243.3042627-3-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com> <20261001052243.3042627-3-mayuresh.chitale@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_190814_675656_E605603F 
X-CRM114-Status: GOOD (  12.47  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mayuresh,

On 10/1/2026 1:22 PM, Mayuresh Chitale wrote:
> +const struct gtrace_component_id *gtrace_match_id(struct gtrace_component *comp,
> +						  const struct gtrace_component_id *ids)
> +{
> +	const struct gtrace_component_id *id;
> +
> +	for (id = ids; id->version; id++) {
> +		if (comp->id.type != id->type)
> +			continue;
> +
> +		return id;
> +	}

Following up on sashiko's comment: we are adding support for SiFive
pre-ratified trace components on top of this series, and they are
registered with major version 0. Using version 0 as the table terminator
means a driver cannot list a { type, version 0 } entry, which the
eswin/EIC7700 SoC ships.

For now this works because only the type is compared and the
mkversion(1, 0) entry matches any version. But a later version check
would silently drop version 0 components.

Since GTRACE_RVTRACE_ENCODER is 0, the type cannot be the terminator
either. How about reserving type 0:

	enum gtrace_component_type {
		GTRACE_COMPONENT_TYPE_NONE,	/* id table terminator */
		GTRACE_RVTRACE_ENCODER,
		...
	};

	for (id = ids; ids && id->type != GTRACE_COMPONENT_TYPE_NONE; id++) {

The NULL ids check would also cover the missing id_table case that
sashiko raised.

Thanks,
Leo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
