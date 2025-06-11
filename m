Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B56FC677C4
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MgK3hCSfvZrpNTyfOXm26eIpvUVtVvpCAAoxx9eJw/U=; b=WAzT8lUTm5cXPS
	AoItxQooKA27X4aBLwP65Ptqm8eacCKIdSTb+XCUVhha5FCWivBZ/z+yQRMeN9Z+96tOf+KdHdYbX
	TpcHw9rRjeWjYw0sbvSzvIcB5+DFztkRSwambzNcB/x+DaX4+hulPfxPOasdNGHsDr7HqUQ9+a/TX
	SMJ5o+lV0QdLhocieJ+gz98sHs6JdEv5qKYmyrtpUxQLlVnIBzGDPZGD1bRnPldgY7rlwBGKPh7aF
	jkOkdFgrpMgQJ2jS/zHCUns+PEfROLNVpxgNZ6YyYrH/HMnd6iLHzcjvbqnf7Xq5euIZr5ukMeuZT
	kIOgz8T5rBIz5h3e6ozA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGwQ-00000009I2b-2Zoc;
	Wed, 11 Jun 2025 08:36:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGmd-00000009GOQ-46rU
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 08:26:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=mxDj74r2F7SZcoM0PboKeLbt+zjbwKcJyw0F7Gv8gm8=; b=X8ncUjFaWVtxAwQXjPa/EyR+NQ
	w7Ve87u6MdC+A/74ec+SzRu52NJ5AN1i1kKKzfimipTvui7NFVNFEK64zFWCOvAUQuk+EXaToccg+
	NEj1ZmnxfXa56eGp8fKwLw0tE83DZjjpPfw1O/kdIFLJuArHJ0LAuQfZQq64uvTnfZat6gH2fTYA3
	tia3LdnhyZHmo678wj88J2XcbMJW0f0hn4dwSOG6SojIUs6NvZUKxfIKbKrz3ZNU/DfVIIeENj5je
	gEiH7mHhYXr4aSUBNsE5DtxFw8dfpaf/9PiF+9PrIVyl/PWPt0cIMQWyxwpfRlprB6WlpumxdWGif
	n8OYIlyQ==;
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGmb-00000002Bzg-2DeD
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 08:26:07 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7c597760323so655273985a.3
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 01:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749630362; x=1750235162; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mxDj74r2F7SZcoM0PboKeLbt+zjbwKcJyw0F7Gv8gm8=;
        b=lDTwrLsiZcHcN2R1VtZDUB1FwvEjBYIVVHWRMX8wrlKPJb+12nRXPnFSDpmorxfrSM
         gJ1Kxf2ugn/HZBwTgmyR+i/CHtRby+Em3WVF23Jj+1M7x9ANqFvRuYeijdn7tCWSDQz2
         Y8QW+sR04jpKCpmSqNgfo7TdMuoKFCD/afS5oTqvKPQRig5dHrqSBUD0CN6y8qP2ZC7j
         p2XN9Y9zfH6SyEBUrxrLkYmI3rDhLGh5DkVAxwxh5ycQCNTvffPbZCD4/ZMjYgWCmRtb
         hnxT4Bn2NhPZaw6WzKUaKWNPI39PMj/cp9V8Jir+XqU/Mh4oN3vQuFul5uYyLXqyfO1F
         YoQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749630362; x=1750235162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mxDj74r2F7SZcoM0PboKeLbt+zjbwKcJyw0F7Gv8gm8=;
        b=Q0HBpdkMfUVFE/KE79EAP8oGkZFcTrvG3G2IuKARsN5WQQHbxIs3gxbhm9F9TRJi5/
         fHLmDl+RV3CrjRh695q/ie7Z/mO5W5Y3KeD9fMHtnoSOQIhqjjNn3+NIl5edqFuqHoHz
         NYX/W5NJ1KFGpyrEPqARApzi2ivuoIxryKYDikRIFv9N2WZunhn/kRi9zjG59VWc+9nW
         GnXbOIA6U3iiAb3Ro0y13zltFmu67553ZK2VfFu68wSlVgBGq7N2HLldsDaeDCoRdBO7
         pNbx5FkNYRtINu6OSbN/dfVLPai7PpnOp5IALQvOUp+yqvRyXSs75CCCpfUV5oMS2ao8
         yyQQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1MoevMMog/UE1qxH0z7uKeUcnO/8rSQCVkr+qKobQWDlpoRru7SaBGrssviFuJq2H++9qwjcQX3uBAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+QNYRViWMjTBW6jeb8wtUsR4Wp5wtLwxvZxSkLFBYF/69mYSB
	oIPiXQAPhNJ6EVSCaUNsEad7+9OYvjkKx4U5gtBBgdcKiQm+8dekD6rh
X-Gm-Gg: ASbGncvtJd1DngVQIURh9IdpFWVJLxYyl6lrkC0au7NBGYPZyEMNXhXw2xRXXTPU6eY
	/7CQj1QcJCEsbuSX0x72yD6HMowB1oGovtA/SxSMFe9YkWK/qcd9IfZDZR1j/sVGmUTN7KOp9D2
	Dj1XK6jdaQUjJlpmr4CxTMVONJ/UBjtGuuJRDNGTe37vhuFSQbps6qGkEfRno88Esx0OLVNikkr
	hrTnIvAvZbv9PNDi8iupJxaNvbk/NDXFr6BF7eH+jjjepkvLw5cltXjjLuVN8LGxXhGzf6AIwzO
	H1hyKHCyeXZznrDbBYEozNB+3d8E/tdswByKeh7eWWpI01+J
X-Google-Smtp-Source: AGHT+IEwaN4dBdPQ+NDYVxNKaVab4sJPvqdTUOFH7bLWBppsyFBAN2TwbbXkYP0gjhdzUVTSukz4sQ==
X-Received: by 2002:a05:620a:3904:b0:7cd:3b02:b6e4 with SMTP id af79cd13be357-7d3a8806020mr398355185a.1.1749630362302;
        Wed, 11 Jun 2025 01:26:02 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d2669b4444sm834084985a.105.2025.06.11.01.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:26:01 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH RFC 0/3] riscv: sophgo: add top syscon device for cv18xx
Date: Wed, 11 Jun 2025 16:24:48 +0800
Message-ID: <20250611082452.1218817-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_092605_712787_F1FC7603 
X-CRM114-Status: UNSURE (   7.64  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add top syscon device bindings related DTS change for CV1800.

The patch required the following 3 patch series.
1. https://lore.kernel.org/all/20250611075321.1160973-1-inochiama@gmail.com
2. https://lore.kernel.org/all/20250611081804.1196397-1-inochiama@gmail.com
3. https://lore.kernel.org/all/20250611081000.1187374-1-inochiama@gmail.com

Inochi Amaoto (3):
  dt-bindings: soc: sophgo: add TOP syscon for CV18XX/SG200X series SoC
  riscv: dts: sophgo: Add syscon node for cv18xx
  riscv: dts: sophgo: Add USB support for cv18xx

 .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 57 +++++++++++++++++++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi        | 40 +++++++++++++
 .../boot/dts/sophgo/cv1812h-huashan-pi.dts    |  4 ++
 3 files changed, 101 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml

--
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
