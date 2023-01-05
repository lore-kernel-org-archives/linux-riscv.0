Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D3CC54E76
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 01:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6S4Fs3/nM28b1xwNU38TI7/8TdOTUBgCJyDOpPqI80I=; b=I1nHYuJeXu+Yr6
	4QNwHse26zuK5y1EFfj4fOMG7Y3sqFsBMaBbKYMQj/IfTlHhpzEeyx/7HbaDH6oEwRDkQp/pEMckI
	4z3M0405cPNvCywuZ5vhYh/o96foGUMhdvUZpX4WnLx7170JNOgQYQftyXm/w6ZyGIOiPErXLEUsi
	5J7S1UWhqfx1bEa1W8bLFRDP4PyDid6c+B5h7h8JyBpdrt2PpMGtAfTx9DDSMVLJsJ60jtFCtxGNg
	ehxeiG13tLLXYVVf9DN4Ean9XEjBVcsOEKgTwrCgmOMKVZv1M4FJCz54hWK6Q90V3NQ64CapHyl//
	5pYFzfEWvmln3xPTcusQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDZvI-00GHwy-Eo; Thu, 05 Jan 2023 23:45:24 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDZ6O-00FoY9-UI
	for linux-riscv@lists.infradead.org; Thu, 05 Jan 2023 22:52:52 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9so24132776pll.9
        for <linux-riscv@lists.infradead.org>; Thu, 05 Jan 2023 14:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t+1Y716yohfg2jJGDpC9Mm0+rOnzxTQAu/sHCuPL2KM=;
        b=cSFo5FtDyzZrfSrtCo1vjOfuJZcmya6aX4EMIfNS1PiiCCw8R8o6I4HXTDYLIFPD7G
         l6oqGMbt8PyZ6OwKyzxMZfbegOurfyE/nUvQwzhwpYrbXneMJHC7wMS6T688rCg3BHQq
         ILn9lAG7Tl7mqlTkmwqzx0WU2uUPUWJRYYefxW3UqcEjt710QNf5GoYxx4Aj3sVlKihE
         zSt5dylARz/0v5Cr4sZDwibB0ttSeZDIXpL9HhwsGN1TBaRbHC4AMOe6qpo7Ivgp29Mu
         /zy4X3C2I8XT42IZoAOT57ZN9grxz3SLI/yK2+ksRsmHZiTSQqiYeqtIjmQMPsXN7CTa
         Gspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+1Y716yohfg2jJGDpC9Mm0+rOnzxTQAu/sHCuPL2KM=;
        b=tMijQEnn7mcQGrr2QTNHgvTgIh4ymBrdyWJV6jBRsWlYAe+hAw/HtKv7kY3u+uSzfY
         VFmtkUsyXwZP0LsfeDOtoJplKCgO+UrZsqyrOvdkqYdWvi8zK2fOk+fH04L5Ap+O3o8E
         7fCU2my22rcgy5dPqAcYED+edQWpBAHz/5b8sxbragJNqGWnwURADfzSZ5TTrwlyDDAs
         KJv+vZmlRFcS+8k0AG9MrLHjnusrnAEmQR8Q24VTnZ9PmNAaRL95Yy4MYQCU1uLzlSyG
         5/KHeVuYNPaCSv8yP7MONb1JbeoUfvIxRwBTe3ShA+MpYgtnGVVeoJYcppzc+xj7vK/d
         5yjw==
X-Gm-Message-State: AFqh2krq1GAGinN3s9CYrzWetkH154oK89neqqV9gxyrxvbxPJTuQn3t
	RM0anVL97rio3xzb8+qx2S9AgA==
X-Google-Smtp-Source: AMrXdXsoKJStIchx2BZIfo8Eg67U5VNU3bl12wCIA53l5gcY0eYpsbkfTpGyQx0osjXFjVIhrppiVQ==
X-Received: by 2002:a17:903:50e:b0:189:bda4:4a39 with SMTP id jn14-20020a170903050e00b00189bda44a39mr52342354plb.49.1672959166962;
        Thu, 05 Jan 2023 14:52:46 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id j2-20020a170902758200b0019269969d14sm23675642pll.282.2023.01.05.14.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 14:52:46 -0800 (PST)
In-Reply-To: <20221229170545.718264-1-ben-linux@fluff.org>
References: <20221229170545.718264-1-ben-linux@fluff.org>
Subject: Re: [PATCH] riscv: uaccess: fix type of 0 variable on error in get_user()
Message-Id: <167295914585.11542.3959390296046499334.b4-ty@rivosinc.com>
Date: Thu, 05 Jan 2023 14:52:25 -0800
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-e660e
Cc: aou@eecs.berkeley.edu, Paul Walmsley <paul.walmsley@sifive.com>,
  linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, Ben Dooks <ben-linux@fluff.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_145249_014201_052CFE14 
X-CRM114-Status: UNSURE (   7.42  )
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

On Thu, 29 Dec 2022 17:05:45 +0000, Ben Dooks wrote:
> If the get_user(x, ptr) has x as a pointer, then the setting
> of (x) = 0 is going to produce the following sparse warning,
> so fix this by forcing the type of 'x' when access_ok() fails.
> 
> fs/aio.c:2073:21: warning: Using plain integer as NULL pointer
> 
> 
> [...]

Applied, thanks!

[1/1] riscv: uaccess: fix type of 0 variable on error in get_user()
      https://git.kernel.org/palmer/c/b9b916aee671

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
