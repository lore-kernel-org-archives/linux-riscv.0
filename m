Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6B0C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Dec 2022 19:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Date:Message-Id:
	Subject:References:In-Reply-To:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZDuv8eb9nGbX+ezJLy847y+ZAY+ROCRncVXJmABBXKA=; b=Rlmgba34hxpXQY
	Y59hCPMpfIkRuax/Peo9BbrKqzBLT5ewcDrEqttLjAxhz5sX9jDCNJswBzLjDp5ieDXqU88IvbZzX
	UrScIRmXpGyEt/uQLJDubB/y6gN5Y31vTXCWo1l7L4+b1vw36C5jh2Ufd/PuTRzH8Zgx4n5J0DTrD
	DT8I3TIJLug/MiWu2rp0jiIdv6TRy3zhq1sO2fFAGCVEKlcFV93khFJRpZJ9flSKbTMY88VbSKnT4
	EMhVSOatwqrmSs/Bm4GTfjw+wK62uVlvndbx+q5+BvcgP8WT0ClgwNythei1mvEQrBb8Ur1mYQZpg
	CjCEaAC8xp8J3HBuqrSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAc2r-007Z4l-2t; Wed, 28 Dec 2022 19:24:57 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAc2n-007Z18-VJ
	for linux-riscv@lists.infradead.org; Wed, 28 Dec 2022 19:24:56 +0000
Received: by mail-pj1-x1035.google.com with SMTP id p4so17078808pjk.2
        for <linux-riscv@lists.infradead.org>; Wed, 28 Dec 2022 11:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gi3zvO6Olcva1kg4+Y4UbWJDCn6QW716wEFEgOGbxuA=;
        b=iOyS/McDbE09MMnd9Jagc5mp/Zz9qwez3eCk8crGeMJ/SJVtY5JIFHTRSwd28t2O/w
         Vvvm/1y3DvD6+4WOyX6ZW7tr1EQIi4/Mq+JhSDLDg6/qVP1JKmqJghk0HfIeI2uVHtA5
         0bOtdDI+VMsMRtHWxXoc+aE+JiAPYe2fU84AFNCslo4uaMzy94vxO7TS4cBWOuqqEuAv
         fTBTqY825cre7pwVuhukhtoEUehw0PdDwxw8vrAt6jVCR+M+of9vRbrOK0A6ZU2DRy2Z
         L/bEL5ZPp+f9mGWhVTiExV0jPAQ/yovO7tYlfRn8dCnEy6bLw9tZD8I3vBoRy6bFiwVz
         FE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gi3zvO6Olcva1kg4+Y4UbWJDCn6QW716wEFEgOGbxuA=;
        b=EFL6Iwm+zuEYWEtaR6yF+YIFncF3uE5jY0zpv8dci4p+6evBG3CABgfU60Oc2XSq13
         z9yXFPoFXGmpNr+LAC+3CcnJ1Ht+9mVTcaZnqRb2LAnd58SDE0E0aSoBMKIdX2e9T528
         D64RxM2mVgk/THtgmcQVBzEZU9oWLKGYih55NGW9xm8luWdMX5gQJZhzILXQmGbGwUA+
         TtgGClwhi3kdYSfiXaRO4vTDddsgf4fO4P2nkLm0944N+sqElZ19iiNeh8BHEik+VbXk
         CICDRE0C5HrRal4BjC02kGu81/LtkhhF5hEFnFXxjC+9Vqwvbj564UqFCaJ+6jqouVSp
         vwzg==
X-Gm-Message-State: AFqh2kp57W+8h5CWfleFM6QZN23N4+JkmMCypNtrATXa8A5GIpLw2Lnv
	zEgySvpd2wxWGdytO4gOkzkPWL5vV6iyOheh
X-Google-Smtp-Source: AMrXdXsvER3GS0QGdJES9FIAll3NENg9Enfj1igB+4SrYGdpu4LWNsxa5hY3VYv+4wLeO17xQbHDSw==
X-Received: by 2002:a17:902:ca14:b0:185:441e:222c with SMTP id w20-20020a170902ca1400b00185441e222cmr24425627pld.39.1672255491745;
        Wed, 28 Dec 2022 11:24:51 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id m11-20020a170902d18b00b00172951ddb12sm11490181plb.42.2022.12.28.11.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 11:24:50 -0800 (PST)
In-Reply-To: <Y6yRULqZa+NtkcjP@spud>
References: <Y6yRULqZa+NtkcjP@spud>
Subject: Re: [GIT PULL] kconfig.socs symbol conversion
Message-Id: <167225428483.14530.3368527680488639805.b4-ty@rivosinc.com>
Date: Wed, 28 Dec 2022 11:04:44 -0800
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-e660e
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
  linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_112454_255933_B8A84BC3 
X-CRM114-Status: UNSURE (   8.02  )
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

On Wed, 28 Dec 2022 18:56:16 +0000, Conor Dooley wrote:
> Hey Palmer,
> 
> Please pull part 1 of the Kconfig.socs cleanup work.
> 
> This PR adds ARCH_FOO copies of SOC_FOO symbols, so that from v6.3
> onwards I can convert the users of the old symbols to the new ones.
> I've also gone and converted the various bits of Kbuild infra over to
> the new symbols which I will merge into my dt-for-next branch, hence the
> PR.
> 
> [...]

Merged, thanks!

https://git.kernel.org/palmer/c/4e1ce304ea19

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
