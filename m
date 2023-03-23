Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB92C6FD1C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 20:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cQBMaKrGzPBpgGDGN6rS0GDX67WNadMkvwATGRNDUfU=; b=lVV7Uvdy0rE0wI
	ohPD7ZBiJs23UYLD9tLgolOxjhvWogDwLixlcifNMl52W4t7IAIJ/u/mdmEfpfdk5x1jw8Cq74yX8
	RkcgsJd0uMpOslgI18Gj/oIc+YTcIUQSm3p4Oel7flDabniCBE91rjzKVD0f6cgy5EWQ9bk1XQkFz
	kcWiz4jGvh/BBBUZHOCdBz5Ea16A084Cma8JVQcRVTwE1KcIDrZui6NCZMO+3TQmOs3tiudZSw6OD
	64fjjwJ92PCn8CDdfJ0Tm52NLEbElRMUXWzqwZIAzZK4XDRrQ0oxKQkq58GhjGprGeL4nnS8yiyxt
	S9jPxruGY5oIgx3EZB0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfRss-002wz4-2c;
	Thu, 23 Mar 2023 20:50:06 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfRsm-002wwJ-0s
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 20:50:02 +0000
Received: by mail-pj1-x102c.google.com with SMTP id d13so22594525pjh.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Mar 2023 13:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1679604597;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M1Uul858JFOc4slgtlzEor7kzW5IkLa0my4yRuVlvyQ=;
        b=ZCCwxjIDJyAzWKJ4Dm7q8drS9iIvM0hjIlFZuu891sZNYdObjxpAQMuckoUN5NAbod
         YfsEbbaDONhPM7Gqjse5lp2T7AWHg/UwjE0efOKZ4M7QsxrkVdTLfGl+nkQQ24U00u7b
         AhurTzPzIu3NZmfHmSWY4/Lmk6XJR0rEqc1iG0IwRBBoYzIIv0bSfHVeo9kRvaHE2r35
         WwHqt2/1RqKrwGMlkg1jn2UTCxtk2tgjsliotC+l2fhl9KYskZlkSf4gmIvuROsrdi+6
         XJGvqHr0+DRJST5E/4OLo1B3GMd6YPsqe31xigKppOA4tAqZcwQo6K5v34F/DmvscknR
         zJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679604597;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M1Uul858JFOc4slgtlzEor7kzW5IkLa0my4yRuVlvyQ=;
        b=R/ifVBkvsEmKhDN0Sxktzm27wqKiawY+KJ19w7jBNL1ab5rTcyMwM8AnV3Cd1poegU
         XdYzMxGgJ0r+U7FDLrIgyUvzpl2wqMZcmVQNHcA2564zB9DcSuiiJroE/s4uVTMlqUku
         wbcHPVTd4JdKSCWJh3Kly7I7KZCTvpQq3aA2pRyg9MTp5skMZuMkDMcdYSpSCeYrmmnN
         TfTMw/l3iT830W9ZTX2UKqoY7hQUfqgfySpg8N0Btuap9W0/D0KBROMoMHF5IFtUEonp
         466rIzY9XduKU6SoV+nM7t3gIl7gP8xWhL63gu9kt4QStlsRAebt859i93/OZ4dhWLsX
         pkig==
X-Gm-Message-State: AAQBX9dAgrhxlmLwzAkspZBiEScNrm0AxVrR2wLThTz/NQIHT++6SJmz
	7+v+drzoKsO8aidKY+H2QvdDVg==
X-Google-Smtp-Source: AKy350Zr1GRzGFoiPnXthakhzlVrWQ27tcYR20J9buwGWiDH1AccoQsn0StymwoAZeIzzNdJrKdc9w==
X-Received: by 2002:a17:90b:4d81:b0:23b:3422:e78a with SMTP id oj1-20020a17090b4d8100b0023b3422e78amr372422pjb.6.1679604597027;
        Thu, 23 Mar 2023 13:49:57 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id q18-20020a170902789200b00185402cfedesm12757133pll.246.2023.03.23.13.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 13:49:56 -0700 (PDT)
In-Reply-To: <20230313-riscv-zicsr-zifencei-fiasco-v1-1-dd1b7840a551@kernel.org>
References: <20230313-riscv-zicsr-zifencei-fiasco-v1-1-dd1b7840a551@kernel.org>
Subject: Re: [PATCH] riscv: Handle zicsr/zifencei issues between clang and
 binutils
Message-Id: <167960451913.18089.10045388605224266027.b4-ty@rivosinc.com>
Date: Thu, 23 Mar 2023 13:48:39 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: ndesaulniers@google.com, trix@redhat.com, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  aou@eecs.berkeley.edu, Conor Dooley <conor.dooley@microchip.com>,
  Nathan Chancellor <nathan@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_135000_525069_57FE2FBC 
X-CRM114-Status: UNSURE (   7.96  )
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


On Mon, 13 Mar 2023 16:00:23 -0700, Nathan Chancellor wrote:
> There are two related issues that appear in certain combinations with
> clang and GNU binutils.
> 
> The first occurs when a version of clang that supports zicsr or zifencei
> via '-march=' [1] (i.e, >= 17.x) is used in combination with a version
> of GNU binutils that do not recognize zicsr and zifencei in the
> '-march=' value (i.e., < 2.36):
> 
> [...]

Applied, thanks!

[1/1] riscv: Handle zicsr/zifencei issues between clang and binutils
      https://git.kernel.org/palmer/c/e89c2e815e76

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
