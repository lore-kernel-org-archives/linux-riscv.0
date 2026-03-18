Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00A1103E197
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 15:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q9gLiOYVT0HBAkUdGc6amOT0Z5lAhMnw8VyX1HOXDAk=; b=BdX2+jBwOKkpX7
	szVEnrnCrwNV2BtiQTrrx70txkewsJz9P7dddTLF9t+r6TLYBkL/Q6DQlKZ7Au+P6HodWAgrQhfcU
	sn4sPaImhmUXyilJlg6n0/LxerLYmk3sRqSDyKs1e2ACgKMFv2ur5SnO19Io1tnuim1NNG9/vKP8t
	twV1MO0aiqUzcP8dBgg0aPeP49F/UZzxRkLRQjKnJwSlq94XqrrncfcqaOWLcaqJl3dk1PRTG/43w
	pCF7+nk78CGT/dd4Va5aUlcPcpGMUsaanniB9g9L+jCS1uN2TC7ElbjIWZGM/ks2GLfYklamvi+He
	SMmoSPCbI8hjEqMGgbxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2sgG-00000008gqr-22f0;
	Wed, 18 Mar 2026 15:19:32 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2sgE-00000008gqP-2UmF
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 15:19:31 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-4670bcc40d7so17119b6e.2
        for <linux-riscv@lists.infradead.org>; Wed, 18 Mar 2026 08:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773847168; x=1774451968; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6vPHF3H1JF9nD4gFe+bBlsP69LdMi7x73BupREDbQ0=;
        b=QYjiaj2cbSppM/qIdNfv/WdfyQyK9Edgbl8DjGDwzN/Gx9lriSCBmTWp5klvcljM4U
         vmveOnVR39R9LVls6g9sF783mWJxAFOUOp80Z1AhEyAiLuNrxhESApCgaYi1ylVIZrJP
         N4KhCHHte+fHbOvsW6TAxLuIqSpIp+Ikcsp9ZsxOuurkE8uaB5z4/GZb7FEtLK2GO8IM
         BN6IZM5Za5fTQv0LQxRJ1uuR484eEEY/TZEn9T02VUBXYy4AsDcwPk8bJ5hy4UdAn41o
         RhNrFfg/DNCkpIfhbqGGHYceGBX2PdNSbMsP+ASEScMfhIDRk0lut9QHOL75RduKroJf
         0ZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773847168; x=1774451968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W6vPHF3H1JF9nD4gFe+bBlsP69LdMi7x73BupREDbQ0=;
        b=GRbpFAG6L6TBWq74VafdQZguAnb7cNpphPr91pGAsw4Wqf2JFZcMnioxvLpmFRwfVu
         Ns6ODrqUcv5y9hAAM9On8O6krkn2v7VER1V8o5SaAV/tSnOvOLIU540uW7LAhfxf0j2n
         M+yM6U4SJACTvMFC/RCe2/9kZk9CF9GnLg/8VJffetL3XXx7/y1kCUtW6zNY2mfXIAPf
         IZxEignlAQ1QANHo9OLfg8welEgiW4upyK4YJWMsS0vcgAs1p4IsSbt7AxwnJHi8nSPT
         fe6smQ+vOmQ3RQ9ZTrF3Pu2G1a8W7/p4ia6RvXYtAvPh7PbOrtu9Wl5ql/NBebAVDtxu
         qdcg==
X-Gm-Message-State: AOJu0YyL9eEL/7V4oXFqhZ/WWLLVeuKZxmX5/SvL0KiwAmtGoM9c65x6
	wFH/VeUuPMrgl/1392aF2Y0S/rrcQIjp129nsqYmsQRWawrJfhrrXHmIdcdJN47r
X-Gm-Gg: ATEYQzw5JuiPhkRcYszdeajd0eP32IAeZ+Vp63WLcYJibidPjx1oP2eYfBokZ+XU/Uk
	7rtav6pXo48xHfdqURO33IPzl59wakEKYeGzlXeu6AJAYP35576PmU5w0lMMB/Ti0UBmmCf77I8
	/sgkYcfDcuJeWEGmhENoqs4CCJFuMA4FMhhmBddqCk2IXkhoqlXygwsyrjheO3GNgjNyBU63MT/
	OZdLPZC7JY3Y8YC5gV3sQQpYGWy6IU7rmPRPITRUMTNip+2QzObPH59qzKRVtDOzfIsq3uj8q3M
	MM5PVKUk7Y4gNaJQUmsqJvMx4qVoU3O6DppNFM4kLMUiyUNOvBgsVfP3dloWEAspaQHdKuogXSr
	rzEEHCN9LjJi84wrceO7A5qQ32SMLq6qOzN49VdsBeWVmds/pig6rL+q2Na3HOWGrHZn7sQcwuO
	a4ZF+mAUKzZaJidA8t
X-Received: by 2002:a05:6808:c1b9:b0:466:fd51:6a66 with SMTP id 5614622812f47-467ba1e9822mr2203266b6e.20.1773847168375;
        Wed, 18 Mar 2026 08:19:28 -0700 (PDT)
Received: from hinoki ([176.227.243.224])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-467c9c61c1csm398180b6e.11.2026.03.18.08.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:19:27 -0700 (PDT)
From: Andy Chiu <andybnac@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: andybnac@gmail.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	samuel@sholland.org,
	bjorn@kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	greentime.hu@sifive.com,
	nick.hu@sifive.com,
	nylon.chen@sifive.com,
	eric.lin@sifive.com,
	vincent.chen@sifive.com,
	zong.li@sifive.com,
	yongxuan.wang@sifive.com,
	samuel.holland@sifive.com
Subject: Re: [PATCH] riscv: vector: treat VS_INITIAL as discard
Date: Wed, 18 Mar 2026 10:19:23 -0500
Message-ID: <20260318151924.1037423-1-andybnac@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20240628-dev-vstate_discard-v1-1-18e1c5d7997e@sifive.com>
References: <20240628-dev-vstate_discard-v1-1-18e1c5d7997e@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_081930_640713_E83C3E44 
X-CRM114-Status: UNSURE (   5.10  )
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

It turns out that the optimized vrestore on syscall path has not been
merged yet. I think this patch has not gotten enough attention and was
lost long ago. It seems not able to apply directly on current head. I
can resend on top of the tree after we settle down the discussion.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
