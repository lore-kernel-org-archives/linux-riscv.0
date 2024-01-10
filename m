Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1655BC4707B
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 22:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zw+89UzmLe+xc41lYEnMl8nY7vvx5Z8xgukH8HgHX2Q=; b=GcJcT/cM2LB8Y2
	Lih/PQHsylKcUeuUd+bnklvMR3rDkNHKlo4nSc3wu+zwTaTAlSdnHQKf42sumaZC8qrk0BGcoqeqs
	D/gHSGJRTPvvkog/T/aSZXIEC/Cq4NftsRmKz/pwHgVhN0ES1ok6sXWmihvHEqq/u3s6glBlMSv72
	LwR+b8v5k5zfI4JdZccERiCbiOiHAUTGY/Wsx/ElT6BaM5c0XKATQAUxyvN0SI8AhjP+kAGsg+Ply
	R3rCCTpUKkyOTPo1udBjmiZ+fOeK++mARX6ZQ0yFRZYjbWkcnqh6qnRoNqsGNQwRg5RMFr8/37Wh9
	0z3FbzVWaY55TkieNwew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNh9m-00EV6C-1M;
	Wed, 10 Jan 2024 22:34:42 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNh9j-00EV3I-0c
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jan 2024 22:34:41 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-55783b7b47aso4730082a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jan 2024 14:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704926077; x=1705530877; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=amcLJqpm9QgZcs/rA3fHaBICgItRkDbfb+YSi8eii8Y=;
        b=ZYuAvQl3aiasXUXhjVM9F9EpFHHAQthsc4L3nZkYdcB70AMfI4+S8czvESuAr2GYtR
         Ybhkx0JgHpjHdBQBgpx9xZnPBN/SnXUuLCRXSMRvSHQxKs0aTiAaPvN3mKFmPTiNn5az
         CWfhXq2imZSNyPY2WBkAh7nVPVXZdmNVF78F5terWF66w0V6GKbjqxSR9KrvyFxe5QzM
         YhmW/leHhRccUiRm8tHDvhNQZvhi5WH645LTN4w4OF++1F9ssWpv+1dsRM6KbS1N14ml
         X/3JcRxS9T2C3MhfkmPO/QZPh8PLgjGbRbMEdk1OXJqoNeDA8a/Faql6tfBZlwzksk+A
         aHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704926077; x=1705530877;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amcLJqpm9QgZcs/rA3fHaBICgItRkDbfb+YSi8eii8Y=;
        b=fuygNY9G7cjLfMHwD0AhSvwPCU4cTBGPctmrf+fli2M595wOqoiHEm40eZlKyOB8jP
         bN2vuajbdsqt/vNu2lqiONznXYXwrkVmVfLb/W3L+4YArnQjiE+m/+egyH+ooxpf6+4X
         ehp1P4V0EhQoElZ8RgDPj11Jfy6S0ggaYZPCwzFq2W9FYQiiplEKnY3vtCKVCDQzDp7A
         EJnO2Iu5PXHXmpkpHODevAy+b+ohTNpaYrRKESFjTjkSCdxSZvormhJC8CtGvVosUQ4A
         ONWx6FUV+E/FjHYIeDc91i03RM+lrF3JOudLv/IWgNezEPCcjLbjQDzE8QrmwE0QWYHA
         TeDQ==
X-Gm-Message-State: AOJu0Yy+jDOyFsRp+YoGd2pChN5WhgOcf8GehnQv7f4Cep0W07Zmnl5M
	HG3iJ+W6AUR43YvlKaK+fY0=
X-Google-Smtp-Source: AGHT+IEtgolnaN71uAvu7gHsKkVAwem27SKnfOVHefMhJhoKWSuu6zzvffBkF/WaXMgWqgu7v8lEoQ==
X-Received: by 2002:a17:906:1e:b0:a25:1acc:ff45 with SMTP id 30-20020a170906001e00b00a251accff45mr115159eja.143.1704926077219;
        Wed, 10 Jan 2024 14:34:37 -0800 (PST)
Received: from andrea ([31.189.29.12])
        by smtp.gmail.com with ESMTPSA id kt10-20020a170906aaca00b00a27a6d59045sm2493815ejb.217.2024.01.10.14.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 14:34:36 -0800 (PST)
Date: Wed, 10 Jan 2024 23:34:32 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: Stefan O'Rear <sorear@fastmail.com>
Cc: paul.walmsley@sifive.com, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, mathieu.desnoyers@efficios.com,
	paulmck@kernel.org, Jonathan Corbet <corbet@lwn.net>,
	mmaas@google.com, Hans Boehm <hboehm@google.com>,
	striker@us.ibm.com, charlie@rivosinc.com, rehn@rivosinc.com,
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] membarrier: riscv: Provide core serializing
 command
Message-ID: <ZZ8beGSPHBOXl2Sq@andrea>
References: <20240110145533.60234-1-parri.andrea@gmail.com>
 <20240110145533.60234-5-parri.andrea@gmail.com>
 <add243df-47ea-4956-99c5-7bcf19dd2679@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <add243df-47ea-4956-99c5-7bcf19dd2679@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_143439_229506_7961D8DC 
X-CRM114-Status: UNSURE (   9.19  )
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

Hi Stefan,


> "core serialization" is a meaningless sequence of words for RISC-V users,

The expression is inherited from MEMBARRIER(2).  Quoting from the RFC
discussion (cf. [3] in the cover letter),

  "RISC-V does not have "core serializing instructions", meaning
  that there is no occurence of such a term in the RISC-V ISA. The
  discussion and git history about the SYNC_CORE command suggested
  the implementation below: a FENCE.I instruction [...]"


> The feature seems useful, but it should document what it does using
> terminology actually used in the RISC-V specifications.

In _current RISC-V parlance, it's pretty clear: we are doing FENCE.I.
As Palmer and others mentioned in the RFC, there're proposals for ISA
extensions aiming to "replace" FENCE.I, but those are still WIP. (*)

  Andrea

(*) https://github.com/riscv/riscv-j-extension

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
