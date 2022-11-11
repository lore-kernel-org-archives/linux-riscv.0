Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC092C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Nov 2022 20:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ojmZ8hKTOOPN0OMr1Y3gLcpHOhDH9fcCFYfsBxS3AA4=; b=iYgjjq8aMyxA5H
	nzjTpc0TeieVM+r1kVGIOjxYicyxdpqaXAHIF9Q/NW/ILGjhJsiYtfscjV9ozSY2sZWKMfIfXIp01
	uYybC4iCOfSoRyrYAlK6i+mjHfsu5YzN1ppGZPmFaldDmHqsBG7ZikRAyQNcobSgm3HyipDBGiZOd
	hOpRi6puasaLmJ/eil+nGISalwfEPsKYt0lQli0h50ab4FXuIvJUV/zwCgnfWPglOSSxw7AG4pFPw
	uWVWAaGcN3Av1p3oFkvASXVAEN2SytVHsJWhNtWE088yzhQin/cU+SicXL+jiInzE9bT24b045w6E
	yS8QPefSNQnQWYTR8MMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otaBx-000m3y-4s; Fri, 11 Nov 2022 19:59:57 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otaBt-000m0U-Ae
	for linux-riscv@lists.infradead.org; Fri, 11 Nov 2022 19:59:54 +0000
Received: by mail-pg1-x52e.google.com with SMTP id b62so5209003pgc.0
        for <linux-riscv@lists.infradead.org>; Fri, 11 Nov 2022 11:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ElnrwqNrmEmGxc+Sty+CfPe+tKKOnn1Ink+Om4QXeRY=;
        b=k98VqU8gxjfX1untl/8fhYQhAKmTuEGg7oHaMmIXlGUpl0Slq4slRoQOu+7jRiCZUW
         e2erGpm8620B/GtlcWJNr1RjDflo2fmcx/8ACJAVE5PbOE6BQkj7XWCSDNgi2wPTYAUY
         QZ+zOlEqPkI8A9OOLu83sdLnuSbnDeI0oa2NEtVk3Bn+DEt0tZZjNLV+WxmafTpTr7Rc
         8/eYesey0jPFrOa70E0oWUSHzeM3QyermomBftmuNZyYD7nWY7gLiPHW97cVe915qDXW
         enX8ZxQ+yd+KeiqRnbEXRmkF1KGtsGs8Ex+iiN3vqSuUPACdHZpX8lQuxi0utlDVANX6
         UFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ElnrwqNrmEmGxc+Sty+CfPe+tKKOnn1Ink+Om4QXeRY=;
        b=3VgZHVLTd1nA2XJZycyOZ4kdqOT/JPhwUDoAhjOg3iJ6ctpqpjjA5O9mJeRYRtFkxt
         QG0D/U2o7Wk1XoXSU59MOl6BceYRtnXAXcnF+LU5TDaPOT3i+zeTU6so66cptWPKtVI9
         rgFyNjmXTdNYTl5SiZhLpK1w9SBS1P316TzwGnckfR1NOoI4sYuCVtNr7T0ZaOkwgfZI
         PXf2YrGg3x/uwp943ctgKdErQHBIPhPyqyGwnTK4eevH81KM04/u+M3wFMZRWnOcnNtG
         3uBG30EAEWIXwo6yUGys56PDrS+tdYxjkbjQULemEfKnn+Wx13WWv4wBYJYBAxqx3Rhk
         /KeQ==
X-Gm-Message-State: ANoB5pnaa3pDeq0NfHHGe8lGVcigWQNRCBhlZRrR7vHHyNRxZfE/D6NS
	5+v0xd6f5sbDiajeDN3sV+loEw==
X-Google-Smtp-Source: AA0mqf7w+H3r79go//zvI2a+oSkmnoBULdoqTpMYvgSGFFr0ze8jGAa/pSXOXq9IT9R5GI2IzycUwA==
X-Received: by 2002:a63:3109:0:b0:470:90f1:6219 with SMTP id x9-20020a633109000000b0047090f16219mr3046035pgx.256.1668196786409;
        Fri, 11 Nov 2022 11:59:46 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id z1-20020aa79901000000b005360da6b26bsm1954866pff.159.2022.11.11.11.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 11:59:45 -0800 (PST)
From: debug@rivosinc.com
To: palmer@dabbelt.com
Cc: jan.kiszka@siemens.com,
	kbingham@kernel.org,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	debug@rivosinc.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux@rivosinc.com
Subject: Updating python gdb command lx_current for riscv 
Date: Fri, 11 Nov 2022 11:59:37 -0800
Message-Id: <20221111195938.1499148-1-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_115953_452294_A626795C 
X-CRM114-Status: UNSURE (   2.90  )
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

scripts/gdb has a good deal of useful commands to locate critical kernel
data structures from gdb. lx_current misses support for locating current
task on this cpu. This patch fixes that.
It's a small patch. Please merge.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
