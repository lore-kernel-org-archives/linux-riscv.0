Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D50CA5FDD
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 19:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V4qOrcsoV5b3z0rdmDyAsgtd9zaUqK4H6jx+pfQqyic=; b=w30rZBwMdcbtqx
	n0c6PPUJmrsAr/vQneV1dkYFrKEXml0N88S9/jLeSyl+Ek6+9kEDO/lBGFM58QClGCprbxDihGJVe
	/FrKbYA0dT9ojHAEKzhYOYN8tGBsBMzZuNzVvf0Y3/R+cawb3jw/rP2f6ihd5ESRFqhYrswMhRwPE
	ipih5yNF8GZl8wE0lfRHwKFIynxFO6VtuMbnfMieQI8iaaF0ZvNXo/un5ErmCqvXqfprOD1CnvNGe
	7TFhjWAFWwoHRh3tF/wd2NWo/oajfOspAkVAtl/M/cl5oqgfNaB/ASXzcHqfYxzN6exI7cuwyew4T
	ax6+90t73oyRKGPJNynQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCiee-0000000CNpI-1vvu;
	Fri, 02 Oct 2026 19:10:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCieb-0000000CNoa-019L
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 19:10:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790968244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SqOef5FaraL1edtYgsKupndEumwwwfe19d9XZdXNw+I=;
	b=DKb2TNYPGMwG/DJbyu21e05ODze6kh0tzoQGZvWFVaPp/wDyeGdKCK/thnKdtubwSffmy3
	tYwI6Zp9ua347gpJgn0v6/4LEnt62eQpzWTEUtsbvSWT9Qwc0mzt9LHu503hbK/Ezm+rmZ
	ixAyzitYUD5mkFn3GmpuNWuc/ywFGEU=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-v85J7u_XPk6OvPX11RJ0cw-1; Fri, 02 Oct 2026 15:10:42 -0400
X-MC-Unique: v85J7u_XPk6OvPX11RJ0cw-1
X-Mimecast-MFC-AGG-ID: v85J7u_XPk6OvPX11RJ0cw_1790968242
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ce7a85f04so200172785a.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 Oct 2026 12:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790968242; x=1791573042;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SqOef5FaraL1edtYgsKupndEumwwwfe19d9XZdXNw+I=;
        b=cUaL1VwyziCUa2G4ix3lFQPutYXfM9YFrqvpifQJZVmx/+dh8FhsaFtQ/CtKvo670p
         ui+GxDNxIhCZ4mLGu+rq8XDXqMJ1+LjZr6sr65qLA60lpLXKqjIEengdG7BlIihl9Od3
         TGycA/+hMXID/PK5F+SYCPQ5aUZWrDUASZ7dLu5P58tp9SyDFUu4+Gf/Ud3zeNy3dF/J
         MJJYXUAXlCnSVC1SIrYFsOmKVjrzliSmL2TH6nBEayZGMwenDDISKHG14/alOoFAD2OR
         hM9O4i8q05yU1DmJFtbxApwZWrNT/4ysk+TXJkr6WM54F8o3z1IfIEb7F/b9KxVn4Lyd
         29wA==
X-Forwarded-Encrypted: i=1; AKwUvBzMVwWiabN3h2KDPWpwNGEbAO8P+azUWd1QQiPHsFUdfoelL9fyOkFt+EJ2rqvuaUcKE4ewhjiV5YEB8A==@lists.infradead.org
X-Gm-Message-State: AFuF++n3snXaLjhsd2+0qSn3KmVRGQx+IubFZa00GiMBirGI4W4q7eo3
	0BjtwSEfbIMwZldq7oK04VXfvcsM6wTLSIVD1tfr6el8J6aW3DBE3PnFnO02ztvKk3ZbdCiSiJD
	k20VxRGDTCOIzPS1oTr/YrMRQcooJoGrjMxKLlyrnC31AnwErGMf+h6oS4t4N44daJNltBA==
X-Gm-Gg: AYBFou1s30Ji0GTyXqTP+j13VYBvJYG/B4AGaS2KJo156EKV1hSYRvWUj+in6xHXoj0
	G4RUvaEmJLC9OWm0qhDWCGFFqD+AYEyqeTErBOB5xcKffoKXb8nsXiPf+skEKIio+RrLmX5i1zd
	qIefxdMc/9fjlqCv/Cv5vfDK+S8h1a1yTKxzKyVaDNoJcPgYkjZWqFa4OQmWclaaEXEJHQSJwBL
	UD/2pdg6OgMHaDWsS4TYKk40+zsNYDvTtYuNZZYJxnfWzlFzECwq8JKnWcoBLGvEitX2X2zAPwa
	/YVE+KyWHYhoLWiUypC2hOzEmerd749DFFMu7kShWSbgdyeUsX33CmIcu6+cm40nRrsvWQ8qy1r
	jYjRhNsgeDzsZyw==
X-Received: by 2002:a05:620a:278a:b0:93b:d7a0:d9e7 with SMTP id af79cd13be357-93cf19d98b0mr663875285a.65.1790968241809;
        Fri, 02 Oct 2026 12:10:41 -0700 (PDT)
X-Received: by 2002:a05:620a:278a:b0:93b:d7a0:d9e7 with SMTP id af79cd13be357-93cf19d98b0mr663869285a.65.1790968241277;
        Fri, 02 Oct 2026 12:10:41 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb ([2600:382:7723:4eba:66b1:961f:1a2d:af55])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93e457a4e20sm177796785a.40.2026.10.02.12.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:10:40 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Conor Dooley <conor.dooley@microchip.com>, Yixun Lan <dlan@kernel.org>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
In-Reply-To: <20261003-dr1v90-cru-dt-fix-v2-0-6e7d96612ac0@pigmoral.tech>
References: <20261003-dr1v90-cru-dt-fix-v2-0-6e7d96612ac0@pigmoral.tech>
Subject: Re: (subset) [PATCH v2 0/2] riscv: dts: anlogic: dr1v90: fix clock
 dtbs_check errors
Message-Id: <179096822701.834873.13625187278784966753.b4-ty@b4>
Date: Fri, 02 Oct 2026 15:10:27 -0400
MIME-Version: 1.0
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=638; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=CgnHm+pOx1EqQqkPIiwdM7WFpAfZXzamTaQBTcq0Abw=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIOMK67m3Ay+Nfj4xaHN4q8WRyRc17z+nwBXWfeqNKTg
 S/i4v5HdZSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCRnzwMf/g6Vd3Fj0zZvYw5
 59vrz2JdzDF6dxfteFI0a+OuPs7sxhpGhusXj6rYutcsk9M9XGoSrvh16X6Tc91XZQUFWH/3ipZ
 KcwEA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Yyk1u_JqpoBYSw6s0BNE8zCe_hDCwe8F4nQV6w5CL0Y_1790968242
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_121045_116223_85E10330 
X-CRM114-Status: UNSURE (   7.09  )
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


On Sat, 03 Oct 2026 00:28:38 +0800, Junhui Liu wrote:
> riscv: dts: anlogic: dr1v90: fix clock dtbs_check errors
> 
> The external CAN and watchdog clocks are optional board-level inputs to
> the DR1V90 CRU. The current binding requires both inputs, causing the
> common SoC device tree to provide fixed-clock placeholders without the
> required clock-frequency property. Consequently, dtbs_check reports:
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: clock: anlogic,dr1v90-cru: make external clocks optional
      commit: ca4983a301063d9cf8d0ef556883f90a94a0bd32

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
