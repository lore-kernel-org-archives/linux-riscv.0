Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A72BC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 05:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iWn8rD1quEOxjsy3MGnQjy/EEMYFzg1n6yYwLXqo6Bs=; b=R8YHRdy1Kd5PAv
	Wx1P67x3VUpYm4U67AOSt8C5EEcZ8gFWnMZe2+caVwPXaXm4h0otDh2OzOZtJd2Y9r9fO+YieQap+
	+cLqNcrSlDBdQyw8aNrtsPGEtDAIPiaU7IvX1UCxtFacDgfrlEPrjbI8VBatb5h4Ql3pbGGUFfytf
	qbszafoaz+qSLtIherQcszpyBQBQZ8+qT71X+mSYRMfgDcGwO4kZgTzonepvf3JL5DyuHfz6e85I3
	oDiSUHme9R/G/m2O/ak/9pzirE5DkEBE+qVedLDfnAtFuods3cWcNLzovhxC7eHFFrXzji/4uXnrm
	vBzHFlWQecHq8sEkLgOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4bW0-000Rli-AS; Fri, 24 Jun 2022 05:05:56 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4bF6-000HKM-Hu
	for linux-riscv@lists.infradead.org; Fri, 24 Jun 2022 04:48:30 +0000
Received: by mail-pj1-x1033.google.com with SMTP id w19-20020a17090a8a1300b001ec79064d8dso4650872pjn.2
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jun 2022 21:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=subject:date:message-id:mime-version:content-transfer-encoding:cc
         :from:to;
        bh=VOrN2Skldd6ynBdimZLEfOLlQdQeXbU4ZvduMfJHL6c=;
        b=XgTwJU2SJn7OgRjOacDrBq8AbIvZy9A81IA50d1kPRNcGZ35nasRgjV4RLK/GhrSHQ
         liBXBNjEUUlPp7BL7s5TqwGWSyxagHvQ+xTyaGyQcCkEpt11davqrfMjfjAoapuf6WZn
         v6n8vJYQWsu4abQaVlYDcuSEV6Jot7TID2g+Pt0cEwyChpdWBH/41ODLnB/El/jl5Xlc
         WGrSAghyUAohMDgNK8/g16MxKloX+ZO5e5BTBzscGGT9lseU/cNO1WuZfmcRl5onAV85
         +S2Z1J0jMLcEbiefwlIIQiebdEEaaQDPxk7iERWdaKfVeUWSz1gTQ1mXF06EWgq4DNX0
         fgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:date:message-id:mime-version
         :content-transfer-encoding:cc:from:to;
        bh=VOrN2Skldd6ynBdimZLEfOLlQdQeXbU4ZvduMfJHL6c=;
        b=V9o5Fuz4Y4YoR4EDGroUhkIo17sDsXdAst7ak2OUX+laJC6/DtWg8pwWtNIaSP8ZHg
         lq4F0CKz/aRoAOIbUhfA3mlKcZyVoLifC4Z0uFv8qXtW5ICluyIrOPkf8YZlwjm19/XK
         2IwUBjnHpFXuj1ZW2RznY+BwNXtzPwPGJPdZcMvPt7SfiTBQi/V/3xp3fEq9W2oc4TIg
         RgJevmZnLI3oX32QZ4FHDpDYZU4Pun/p9ixt/qd4EnI/wZ1Qbm5nL5eBL/8pzvcCEsBx
         JlhM8QJqT39Jf187rF0fgdxu9u6QmAtIZI0XyklKDW9gi94P2V8n0ArP/dR3FIWwcAMu
         Jw+g==
X-Gm-Message-State: AJIora9EDY7rWBcOFYFoTfhMm3CaUffacugVelvK1h7/Ypk/T9xAdtHo
	vhBjFHvwjbUEsL2J2Yum0UBW9icAKK3Sxw==
X-Google-Smtp-Source: AGRyM1twjNfvXdC15oBPlo3E7P9L0CcbGOzh0tICPbKtW3VyqvOblbLp0OUdm7yJez7FETjSBlaYbg==
X-Received: by 2002:a17:902:d48e:b0:16a:67e7:d979 with SMTP id c14-20020a170902d48e00b0016a67e7d979mr1887249plg.29.1656046104242;
        Thu, 23 Jun 2022 21:48:24 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id x20-20020a056a00189400b005251b9102dbsm557073pfh.144.2022.06.23.21.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 21:48:23 -0700 (PDT)
Subject: [PATCH v2 0/5] Support kexec_file on 32-bit RISC-V
Date: Thu, 23 Jun 2022 21:48:06 -0700
Message-Id: <20220624044811.9682-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  linux-security-module@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, linux-integrity@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_214828_894390_917795C0 
X-CRM114-Status: UNSURE (   7.35  )
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

This rolled itself back to the top of my inbox, so I figured I'd send it
again as Rob's review landed.  IMO the security/integrity/ima/ change is
sufficiently trivial that it's fine to take it through the RISC-V tree
but I don't have an Review/Ack so I'll wait until this loops back again
to give the security/integrity/ folks a chance to chime in.

If this loops back to the top of my queue (which looks about a month
deep right now) without any comments then I'll put it in riscv/for-next.

Thanks!

Changes since v1
<https://lore.kernel.org/all/20220520154430.18593-1-palmer@rivosinc.com/>
* Collected reviews for drivers/of/kexec.c.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
