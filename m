Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B31606A31A
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Oct 2026 13:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KNCKkZJZ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Hp7aKAmF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hqH6GotrPXVs+aNfmL6ZWjo1anZ5lUPoO9JmnaUquKA=; b=KNCKkZJZoXSLEWURfVNcUNw4Fv
	8Y9YnKKCajmmJq9jwzdMwVV7TahldbnfW/3UakwrX7tZ1g1jc77nrqtiyslzLlEM5T2uzIrbNWIfa
	V9cMCAdSOObZ75KFUOfEDfBLCFSREE1l6IJGUeLaDkevwyMi7MEq7PsMFl20BwYiQnMivCuJU3nKR
	Luh+oa+7hcxkD9GL6Davlg5Tnj+VGmyZ/60HZiD0EbwTAPc9MUFzLS2StTOQVdz2fourb6dXEVvSi
	nXYj//z92pdhx88izJNxnOKvlxw2b5nNSQNR/ASOPM2S2rslhj57qdDJabQqthzw2smNn/DcSV7m8
	EoXDVkDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKxrb-000000013zl-2oye;
	Sun, 25 Oct 2026 13:02:15 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKxra-000000013z8-0Ff9
	for linux-riscv@lists.infradead.org;
	Sun, 25 Oct 2026 13:02:15 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2e7e742a2c7so14118575ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 25 Oct 2026 06:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792933333; x=1793538133; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BeWhtqurdRURXZzZxthQRkSgg7DOPSB9+FM4Irtz//w=;
        b=Hp7aKAmFjbh/ra2gR+Er+br4Py5iWqQAOc6ovKKqdKO0jaOxgojG2ULSODUY6L/wyt
         PjXO6LDmuIIYksWqiXbPozZ9mlUkae9yG0jOEMsoOMNZw1KNITp3x1WgEnSlCUTyuwDo
         rk3iA43SI2EqE/WQh02YahEOFuVgNQy5a2MAI/7FhSE8/k9lA+0+H5HGnwCvVG+imkB0
         Qv1EKIFkCzYgo7EiCeHN3W55L017Fbg5fROqTVRww+dx0mxi+VotTT+R4lQxh0FkB0GN
         c2oSBcxVgR8yszzhxjGPAn46cwtXzP1IjfnCeF/vwMaUULnpEydQMxneVntVaiRYkS9t
         ptMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792933333; x=1793538133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BeWhtqurdRURXZzZxthQRkSgg7DOPSB9+FM4Irtz//w=;
        b=I0Z8Y1uB/n2HoH24M5C1wNcxOcYhpn3np5nZVPhHm4YP8+9z9HdD0MgOM67/zGOzOR
         mvs3kWS30pjOVcgycQhE1YpSCrlExOIjF0ZvWgt35rVDT5Z7zutTAdgfdGKXe9yaQ3+e
         2gkWMHqYIuKd7qLMnNJuzsyRGxANIt9bzP7g5/qQqHhQVhznb9ODIA4Ue2H9BYYSgkqC
         humiRy4exyRgUmHr8zfqxdMEcnQ38R2Kau4LBoIK3SefkQC962xMwwn3YmLFmBrQ9b0q
         9gE6oDYTLpFoYVB62HiNxDmkY/s10aRTjVJ6nEshY3Szb63GzkE04M8DSCBZU6MzkJUA
         gX3A==
X-Forwarded-Encrypted: i=1; AKwUvBwnOxFs1nrpYY6mPxZ8VKGT2xJvozNdFdyfj9yGbnJdaOcIsO66LfluwWZ5/qP8bTJGNe1W8OJi388B3Q==@lists.infradead.org
X-Gm-Message-State: AFq9FYKmbTWkHIRTfYav2S9mXUwqhsKNP6qHzZtVEUo9/cPnys/FiiHk
	9KExq6BVdnQBEgQ5o1D4ENT/Keav4YuJoWBLSUK8MHlvnTiB56yF3hO2
X-Gm-Gg: AYBFou0cngUdBtBsIN7URpPSBOjSlHjprI8C95X7hj8EtGXhZWSxiHye4pgcuQMBBep
	+UMTKtHPNeUsDLLfk2KkLNEL9ekdMNZqe6AKHO+Km1+2LOwxsUHhEsqLccjUFB3CxwrIWsEjjYW
	MwSBmbG8UgRJXz++dwZQZjaV5Irulb3BsscWTlBcHowbvhW2X0RnjmDpu0VpFqTW6ZLrm+xq0u5
	ejNkJ35in4YjwBo/eXlPxOkFVDR6d+72S+oGUajvFS8tB2cM2Y5ZliicBU7iOpYD++Ykrw3ZmTz
	j3i/Qtmyu9GSt79ORRFfzV/oR4CaLt0XdleXRDxA+ivY8OFiJ4GvAa0cmBUuM6o9AYOYcDkXzXy
	BfnVmXtZ13mbb4jdl0wSs5xH8WrgUV8SE6l785l2Mpxd+QL0IyWvuVu+rL1eJLkoxzyiQfYjd7/
	JdantuM3SDZcLuHa6lBLLxa+y1dcLn/R0YSSkl2aghv69mOmcw39rD2VMS00p0P2h85Me4RM29m
	DpMfFeuFhFyaREX/UCRVYYp/k2XvPDWoMkfN8SRgvI977WAvldr9PJVIqW1w6Vq62P6Dcm77cyi
	fXyFanf9eEnThzQ6AcT9CtApdLp3zgJ1pONXmq6v5SPO+XasV2Si5EPavWhVmPGHTtfN5wKmfPe
	qfYgP++AZUm26vSFuLG7RhaRJ7nn0fUIrK+VhygYg3TJ87dlC49VogyRyLA==
X-Received: by 2002:a17:903:198e:b0:2e5:41d6:178c with SMTP id d9443c01a7336-2ea9cc5802emr27275065ad.33.1792933332318;
        Sun, 25 Oct 2026 06:02:12 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b14d1ddsm8430055ad.40.2026.10.25.06.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 06:02:11 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Anand Moon <linux.amoon@gmail.com>
Cc: dlan@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	e@freeshell.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
Date: Sun, 25 Oct 2026 21:02:04 +0800
Message-ID: <20261025130206.187282-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANAwSgQ=Djw_o89MgvEsmKVxuNiE3Yuy=e0T5DcLfqCYy6eWMw@mail.gmail.com>
References: <20261024092558.143621-1-alan.tseng.cs@gmail.com> <20261024092558.143621-2-alan.tseng.cs@gmail.com> <CANAwSgQ=Djw_o89MgvEsmKVxuNiE3Yuy=e0T5DcLfqCYy6eWMw@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_060214_122363_D838E391 
X-CRM114-Status: GOOD (  17.61  )
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
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Anand,

On Sun, 25 Oct 2026 at 18:43, Anand Moon <linux.amoon@gmail.com> wrote:
> Could you update the pinctrl and GPIO configurations, including all
> necessary pin
> assignments, to bring up the SD card, PCIe, and Ethernet nodes?
>
> Please ensure that the required bootph-pre-ram properties are applied
> to the relevant
> pinctrl, GPIO, and other dependent nodes wherever necessary for SD card boot and
> SPL initialization.

I'd like to keep this series to what is needed before DRAM is up.
PCIe and Ethernet are not used in that phase, and their pinctrl-0
entries are already in the board files.

For the boot media, the BootROM has already set up the pins of the
device it loaded the SPL from. U-Boot's spacemit_k1_defconfig does
not enable SPL_PINCTRL or SPL_GPIO either, so the tags would have no
user today. SD boot on a Milk-V Jupiter works without them.

E also asked on the cover letter to keep the BootROM part and the DRAM
part apart, so I'd rather not widen it.

> Additionally, could you update the regulator-name properties for
> vdd_core, vdd_1v8,
> and vdd_1v8_mmc?  On all the boards, the SPL code requires these regulator names
> to locate and enable the corresponding regulators during early boot.

These names come from the U-Boot SPL code, not from the board
schematics, and U-Boot already sets them in
arch/riscv/dts/k1-bananapi-f3-u-boot.dtsi and k1-musepi-pro-u-boot.dtsi.
I think that is the right place for them.

> I am verifying the changes against the existing U-Boot board device
> tree and configuration to ensure
> that SD card, eMMC, PCIe, and Ethernet initialization work correctly.

Thanks for testing. Please let me know how it goes.

Thanks,
Hung-Chun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
