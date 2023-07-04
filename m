Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78628EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 14:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yu3iFUAWEFI6+Toh1HjF4SfCq1t+pJia0KFa0FT/aII=; b=CqaBZt1ljY+vEv
	O3tiV8wKBatBtbRrDW3VRUs2CA+2nSeZTugSDVkWn3te6szkeQyfn+q1a1jGrRYaBmok8oOx7DgpV
	9ORyfU7+wtM2MV2St1T7GfbIaTJXG33CxyWdY0u32MHy3fbqu64Wv68LfTI0VM0W4wROiiqK1L+fG
	BPPmV53rTkLyZAx3+iFgkUkdVxhpuB5n/RFhv5PlqTo7nPN9YZUotbxR58UOEKl+Esiv/gH5MmONk
	99oYXxyZD1c+ZmPECVM5ngHXrcCvRBE75lva+u+pA18eSg08/qCOpyJhlaquJvJCYFh9TFDRRmwiI
	lwBPIbXp9JFfATT6xo5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhFP-00DXkG-2J;
	Tue, 04 Jul 2023 14:43:19 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhFM-00DXiV-2V
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 14:43:18 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-55adfa61199so4156968a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jul 2023 07:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688481795; x=1691073795;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OYlAU2FW067CBfzHhWgN5BaRqRFBD4W29NbdNSMOhf4=;
        b=cjO1IfQfMgr+PmCrA/wfkZZRScNNoFUlMRRf7fupmAifX6WShqVDR0yBHvI0NmsJkM
         Z8tnYHLIIGqplkeTgCk064CS80OVQYWSvkfMXQtCUbLPJlqkDVWoRXeWCg7Y/IcdSRNZ
         fzZ+63WTa5mao6zPv4Lr/h9iCFVgsARH8LOmUOTzaPvvldW51JiLOq60bE1wZuDdc+RC
         dGYxLq1s5ZTYGtE2vZuwEKy6q4fCsVsGiFNqfL+nsa860PfpoTghtHMkbA9mgfJ/ag0k
         nHimRCVQuEY4uj/UpzXih9NfaOah44ctjYoKBpYjLHBfbwRLElrGKflLiwYf76lELM7V
         bNYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688481795; x=1691073795;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OYlAU2FW067CBfzHhWgN5BaRqRFBD4W29NbdNSMOhf4=;
        b=OA4CqB+eeab3rpt1jYQqb+WGZ2XZDgZDw38V4ibXJXQLlJL6UFA4jprBz+xWbY6Q4a
         Um1iNmgjcJVEWxTN0ASaQWYaY2bfDnJdOU/8V9TbTI9gSKtoU9f5G1MdjmT9DN2JhZrr
         tgUYa9kCE/F4LsYEtX+isA2K2paFIz/72gaxtuci1oRhzn8rDdmays2p2eLuNwrvxQsi
         MhBPf4zkAhQ05AEfkegOHcLbgHSEqERgOF8aIybAgtlRLwl/r2zxDWbit//z50R7JWV4
         1ygk8SrjS+mYxSfPRsPsqUTT4j90+zJbBtknqT9tZXrb3vEvy16UcVqJwg65taRyfX+n
         Y6Iw==
X-Gm-Message-State: AC+VfDzYbd6vFJ5B1fcfCkLoH5GYV4bRAI6Qo85wRSneX8yg2o1qPseh
	leX8TzNGjh8Y+vIg8lnn1nvtmQ==
X-Google-Smtp-Source: ACHHUZ79+k54rWGmBj/AWJzAzYNXKDT5ORSh+OuehZP91kz2A/ohzqWRlXiEEE6p9q3kz5PQ/zg7Fw==
X-Received: by 2002:a05:6a20:1013:b0:121:c2f7:df3e with SMTP id gs19-20020a056a20101300b00121c2f7df3emr14241398pzc.12.1688481794753;
        Tue, 04 Jul 2023 07:43:14 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902ac8600b001b8a70e8aabsm1431723plr.174.2023.07.04.07.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 07:43:14 -0700 (PDT)
In-Reply-To: <20230627015556.12329-1-andy.chiu@sifive.com>
References: <20230627015556.12329-1-andy.chiu@sifive.com>
Subject: Re: [v1, 0/2] Initialize Vector registers in the first-use trap
Message-Id: <168848177507.30061.1942260510987151567.b4-ty@rivosinc.com>
Date: Tue, 04 Jul 2023 07:42:55 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: Vineet Gupta <vineetg@rivosinc.com>, greentime.hu@sifive.com,
  Bjorn Topel <bjorn@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
  Paul Walmsley <paul.walmsley@sifive.com>, Andy Chiu <andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_074316_813853_D7D6C5E3 
X-CRM114-Status: UNSURE (   9.92  )
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


On Tue, 27 Jun 2023 01:55:53 +0000, Andy Chiu wrote:
> Before applying this series, We only initialize the space for saving
> Vector registers. This is not enough as Vector registers themselves also
> neeeded to be initialized before dropping back into userspace. Or, we
> may risk leaking a process's data left in Vector register to another
> process. This can be verified by only applying the second patch and
> running the test.
> 
> [...]

Applied, thanks!

[1/2] riscv: vector: clear V-reg in the first-use trap
      https://git.kernel.org/palmer/c/75b59f2a90aa
[2/2] selftests: Test RISC-V Vector's first-use handler
      https://git.kernel.org/palmer/c/5c93c4c72fbc

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
