Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB7CCA6012
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 09:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+IcQbEwdex1QD8slU3AykgujZzK1Q1+DQYt0Uqa4OhU=; b=WPdbt5YEeX3b6V
	9j80paxK92qa0X9DetlmMS1HlPL15otuJHQjwE19mT2/vV4+VD1uwrVcjl9GAmeJp20WIND2kp6qR
	gUgNoBsIFLE2WauREJwuwJbw/z0DtB/t9omQG4aPZ4qEDN62lHjECtAznm7tkv8NZqR9Kg6qq9UKp
	oDRsJFsOIkuiO+2T+6oEX0Xf4kuql06OsOPhXNpjj6dSj/fKT5XoCOUlPFp53anUwhRDYJ9DDQAwe
	zkjRnxgQt9pxaox/JidAEovtJb4gBoQ3HD6m+RbJc9ThrKw9qDnkFtuhtt5C66EE1Pp13+l9C4sYw
	r1UQAAz85q7J8xkeyrOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7Ca-00000005wt9-0OXF;
	Fri, 09 Oct 2026 09:47:44 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7CY-00000005wsd-0fdM
	for linux-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 09:47:43 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2db710396ffso9468325ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 Oct 2026 02:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791539261; x=1792144061; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ux6hJESR9kZkvYlx2D/IGwLIHS0t2PsKL+AJPtGbIUU=;
        b=qDFqdOF3xnXthaB2gN6Oua6Ef697Bmenv0Qr2GZ53RLaTdM6ArbsWFvBkmU8sWLYKs
         VlQOvIwVyp7EXiUCxckyjhi7XB1KarzP8uI2QXkVKVEPm4sGHz1uGECbP/BUYlAE5is+
         VmPIp2PGD/BEUNcACdWtUBZVzojOW/DfiuKslw1lJ0bH0PlPC7UJUqni47MHvyBJxGoW
         MfLpkHoXF+ve0k5ppNjkNOl2hmkplwAFAfKpA8OcLL9vcl9Q3cLzc3xtArGv25h6FvXl
         bO6yZmKbHvqwF7ypK1R928NvtchgOkvi9zKwN9pLOqPxMvc5mpP7jYmcd8nH833UuR4f
         6BXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791539261; x=1792144061;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ux6hJESR9kZkvYlx2D/IGwLIHS0t2PsKL+AJPtGbIUU=;
        b=Pv6sqMFKdvuZY/7zubDrzrK7F4RbqQaxlZ3dp3byILraGo/URSAqMDTxIKAfpXUDBF
         +K6eQaPl2Y2kzIT8/KrpfNmibIdyWdS1IMQ6U0v7lnTEoHjWMgJN8WCXsoJE/0qOOrkm
         Wqeq56M5naTOY+CB59zmnJjNjgGECnjpGbutspKeqQCev9vSSEzg3y8wayW0IHzxUdVm
         RYqaPEa9CPUbKhmMGHzVyoPZCALVbX0dmbV3E/W6GRQ37cYYj2CGSfK4fadI60COpQFv
         L8QAnp9D/2LpC/Wh6ALnVLIz6qm4DQmOom/26AulJPC37caSO4y7SpJINF1fzvYQA3vw
         phXg==
X-Forwarded-Encrypted: i=1; AKwUvBzEkrFn2GqBZlSUhJXNx18JPE/CUZ/P0wMPitIVc8pWDmv7zpogWNUjoMaSMTIzRlcw74AGT1FN4RpF8w==@lists.infradead.org
X-Gm-Message-State: AFq9FYLIR4zyvxolriuYkopkzPav1bgDrRMwZ2mJj3SRIKLDu1iiKoi8
	CVG6z5RO9jRvfMs+K41MEg0QuLfOZkPUxHOkptPLacHXbipD2BvYsYao
X-Gm-Gg: AYBFou3FP69Hp7fSNf/qDCuoovMHGb7nrQxeFODv1EyTQXgqJn2qAhjx5e7KqjOWIP5
	UOunbzipk/mNtVt5fWsxpy8/C6RcOMAHCmy+jQlsM+VIa3RBv4QXvKQX1377j7Wahm2xTuQzCBf
	jBcrs9OsV6ThtaLEa1fMXcXGQgy/3kmLt2OghDLTuYufvwPQxp3Iq/vOCvfW2sQf4+NJIXSfHJj
	15nEu7GdLt5HoTwv8AX5HDTf8KlXu8NFNWtrfK+EdSE/LP3ikTJkZjfRj0vqqpl0u9mWurIDlgv
	VrYRDkLfeaJH1qAUVMwCIpJOuANcctKagDMlz40F5Z0R/Xl6dOLk5gOx2B/1XtSqX3pTASVEdDl
	QgN5zazMfOUbPIEtPCqp4pr/XXvSocA2W98SUWcddnnL5dj+y3h3wtNbhyXhzMqOWCHU+7lYhkB
	d+eOQ9HiBHeJaixWkeiFNhot36SN3eI/zSIVe6cNd+Hbgk5edN3mnA6TC4bDynVJ6v5WcH
X-Received: by 2002:a17:903:1b70:b0:2e6:e9a:eb48 with SMTP id d9443c01a7336-2e842f2d257mr7768075ad.41.1791539260811;
        Fri, 09 Oct 2026 02:47:40 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b17basm5833635ad.42.2026.10.09.02.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 02:47:40 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Hiago De Franco <hfranco@baylibre.com>,
	Longbin Li <looong.bin@gmail.com>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	Joshua Milas <josh.milas@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] riscv: dts: sophgo: Milk-V Duo 256M ethernet support
Date: Fri,  9 Oct 2026 17:47:07 +0800
Message-ID: <179153921381.259252.9054877756385260471.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261005093749.645014-1-chenyou910331@gmail.com>
References: <20261005093749.645014-1-chenyou910331@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_024742_212710_2EDD84FF 
X-CRM114-Status: GOOD (  12.03  )
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

On Mon, 05 Oct 2026 17:37:47 +0800, Chen-Yu Yeh wrote:
> The Milk-V Duo 256M has no Ethernet connector of its own; the SG2002's
> internal PHY is only usable through the optional USB & Ethernet IO
> board. This series adds an overlay for that board and fixes the name of
> the internal PHY node it exposes.
> 
> Changes in v3:
>  - Rename the PHY node to ethernet-phy@1, as the commit message already
>    said; v2 only changed the unit address (sashiko-bot). dtbs_check now
>    validates the node against ethernet-phy.yaml, with no new warnings.
>  - Drop the blank line in the trailer block of 2/2 (Hiago)
>  - Collect Hiago's Reviewed-by
>  - Keep Inochi's Reviewed-by on 2/2, since the only change is the node
>    name
> 
> [...]

Applied to for-next, thanks!

[1/2] riscv: dts: sophgo: add Milk-V Duo 256M ethernet support overlay
      https://github.com/sophgo/linux/commit/627e4e43e555ba252f93784eafff74ed82234c63
[2/2] riscv: dts: sophgo: cv180x: Fix internal ephy node name
      https://github.com/sophgo/linux/commit/673f8e66d5edf424eaf599c8051e0f6962605861

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
