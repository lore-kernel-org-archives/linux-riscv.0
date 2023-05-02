Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BF4C77B73
	for <linux-riscv@archiver.kernel.org>; Tue,  2 May 2023 03:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MVPK7iQVCLn35DWhi0+1uxNj+AiNXsgzyzzTcqfSwGk=; b=A/P3/ttoj1nNKP
	/ejyj8x1sYKSWiR7spr1zCTgKqlmpdt7SXEM3HLyATZdJf6jKWw4B8WycCklb4l/jCqpE1eoFRz3q
	YXBoP1b2uvIQth0ghfNJlZik+uhGFKANq7en2aFAC56+xgIHWZrm5gmr0IUXdnT0JklyIiaOOvLCF
	1zlvBrCUr3iccSPOn+tWw0VLmwqCRwwEjR7bfTmHtC9eS6iC5oAIKU9FH0fguC23tBzZoBPYrtiiD
	Bq56iMzg2thpaWbFXy5owYdzs2GMkZuZ7X/JLzi/dnBg+dzwbC8fix+oSBJqI72gxB//40yZeFBOC
	5Moxgf6DZw3AbQ6eim8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptgsZ-00Hb7v-1k;
	Tue, 02 May 2023 03:40:39 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptgsY-00Hb7H-0D
	for linux-riscv@bombadil.infradead.org;
	Tue, 02 May 2023 03:40:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=To:From:Cc:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pd91ppODkhdQSeDsJCj2eoxzCnM7myNH99JsFWJo740=; b=LgWyvv/8u3oHP40r+Pj30HT3JG
	sMcyHXjTabSkiMKs9J/s2/CWWDYpEAcZt23xbsS08QLqaCGeKmqjw8bkqg1VEdpUtaRoASH68FwFv
	SeWKIJccNx4RyQKi5GX6kzbrWGaqQ+pFf/9If2J0rmTqxYNbTuEVhqy6Uqv3Mwloc9SgS41ozjmD7
	l9xC9/8HY+MK0trbOlcTRI/Tqr9qsjF8MipUHYjUiTB32KLjqiVfTp5bP9wUqweAh4Q7q4wNI4JVN
	obDt3VwFAqfFOfZfsovW6cAOuYO4iLgn7lSmv9wcwUcwPKpzOtKvAtsa8pT50Bv7mOSHyK0h1gdEH
	JihTYsqQ==;
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pteSI-00F4w7-0J
	for linux-riscv@lists.infradead.org;
	Tue, 02 May 2023 01:05:28 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-24e09c5613cso992307a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 May 2023 18:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682989518; x=1685581518;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pd91ppODkhdQSeDsJCj2eoxzCnM7myNH99JsFWJo740=;
        b=HItlprmpUNSwtLo//rzIWz2tjmKjTcDnmKxKcQlKDhisDLq0nCMbH9DRPNUGW4uHHT
         025gFOKL/6M4GrjjMUeX9ajRuNwkRnRepj8Cx4SEdgOnjou6JkrtennuXfvXT4okgqwO
         I8r7ToBJDfH6kh9olhCly5weDpA+g8va4FMbByJ8CB8gKQcPZquu8Qktkg2Puq24R9jh
         R52kSz9SAoMMoM/+twnyemXvF6MKxiXRMBbx3Xdw1SPLqzdG6AFv6GdDzxpj+Q3yej3R
         8tpqhnORkKwNHo5/lpLelvDMLesEGOj+xxfOOuzIEnCu17lzZei64vDFSMT0PBFMofEe
         eMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682989518; x=1685581518;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pd91ppODkhdQSeDsJCj2eoxzCnM7myNH99JsFWJo740=;
        b=kfu0ESje8l4r4eqoOu9W6CQDPpozRwfamdslw8OoiXeeMP/Ei0OLxP9PDx8GA6vDCy
         SSSl3WRjrrrcfLft3NBe059oo2dbuvJYdJh+qlDYg9ohafzmMD2ss+XhQ3pxT+Gn4kpQ
         2v6GgMUv+qZ+jR+/NsdEciqGrCmTF4CuO8lvBNYQDaamNJWavDllpCYuiEY0LLIaPnNs
         NTStdvhTFvD/v9FQ7rin3HCBZKb81oginX7cZtoTJXn/ylNbB1E1AeAi4QeXiLoOp2EP
         kzwSfe0q0BowNmb+6Q36RNN7v+Jd9jbDL3hzg5ywz0d54dO/Am9t2GLdZZSoyAav6pAY
         1G0w==
X-Gm-Message-State: AC+VfDx8ppf0I7z8QGBxiwqZSR1vuT8ysvuFLYQ0FKuG5lSwt5IG5HIG
	7ROyn47dMI5PmsacdCFOLU70gg==
X-Google-Smtp-Source: ACHHUZ7yKG3T46mlxxIAdbjBzW6yOKQOvv0uftti8Dnm8fbxV/qtBXESOiJcvFLpp/x2/ei2/FFRdw==
X-Received: by 2002:a17:90b:358d:b0:24d:fccf:7ba6 with SMTP id mm13-20020a17090b358d00b0024dfccf7ba6mr5349508pjb.43.1682989518048;
        Mon, 01 May 2023 18:05:18 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id s23-20020a634517000000b0051f17e4e1b2sm17202045pga.68.2023.05.01.18.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 18:05:17 -0700 (PDT)
In-Reply-To: <20230427-fence-blurred-c92fb69d4137@wendy>
References: <20230427-fence-blurred-c92fb69d4137@wendy>
Subject: Re: [PATCH v1] dt-bindings: riscv: explicitly mention assumption
 of Zicsr & Zifencei support
Message-Id: <168298679765.11596.12636857720303602067.b4-ty@rivosinc.com>
Date: Mon, 01 May 2023 17:19:57 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
  Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
  devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_020526_017362_2938B320 
X-CRM114-Status: UNSURE (   8.50  )
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


On Thu, 27 Apr 2023 11:43:42 +0100, Conor Dooley wrote:
> The dt-binding was defined before the extraction of csr access and
> fence.i into their own extensions, and thus the presence of the I
> base extension implies Zicsr and Zifencei.
> There's no harm in adding them obviously, but for backwards
> compatibility with DTs that existed prior to that extraction, software
> is unable to differentiate between "i" and "i_zicsr_zifencei" without
> any further information.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: riscv: explicitly mention assumption of Zicsr & Zifencei support
      https://git.kernel.org/palmer/c/41ebfc91f785

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
