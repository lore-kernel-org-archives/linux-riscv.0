Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923C5C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 05:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZaWbMzT3BFmnlPIIT5wvBj05LNPpnPmsBwf+JnpppSs=; b=sYdcZ7gnYNuhZD
	hqvcfHPm0z8Kg7JcJfYSm3oOibuzJwcPnavfM4dlmf+4CXFkETBuMbHLNk5P3e6EPdmw8XDFU8xpq
	MqWUqNiM+hbFlbyrJjwr7bPTVbQpp6BmrY3OCqpzkwDlCKVpbv37i0m4DvxmN5IafWRFmxxhL/VZI
	w9nQvgkwIDoTmT7rke17krutdNkdAeNrDDTGuG1pS5fghgep6PSQMcmqIKLwCrIkV42iiaJR/TR3K
	qvC7BchouJgOQQ5NF3LkQL+CEZCQOkj19gCSuxy+2Dprm9wvmhJC2lkPNx/FwwmxeAFJC/LauO1gg
	EFlmwFgjCpDlAme4ZVnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8ECT-007FHh-Vi; Thu, 22 Dec 2022 05:33:02 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8ECP-007FG7-Ix
	for linux-riscv@lists.infradead.org; Thu, 22 Dec 2022 05:32:59 +0000
Received: by mail-pl1-x630.google.com with SMTP id 4so1019196plj.3
        for <linux-riscv@lists.infradead.org>; Wed, 21 Dec 2022 21:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Eu29fG3f+7YAspRkfHmhlvcLA9unjimxDV2WGeyIfAQ=;
        b=OQlLH7dfBS7CrWRapBdlamhi4y17+k7pmnhPa5dlgmYB/MZ2GgqCfeSgDl2nFEW4vW
         crevkFvB6WCsxoIHb3UqXtXvx2J2Vuglc7Szt8+APxZDho+LdZUIyM5BC9nTc+6xn0Np
         KzKYk4hBPY6Dpi6avJnTFfV9rBmaTS9CK13NkqxamZRxg2PUkcs7luVBEchh7aCcCcl2
         /e4f+EMHs93/S9yrPJYQIycD35t8bGv2myy27Pd7KVDjOseaUxJOR/sgL69MNw5iJW9V
         p8L3UmzlgMlp9L7uJgifXEwhQlg7CIGXc1TMMXdnyYwQ3KqDYj9kmQ6LhLtbSuP4QuXJ
         lN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Eu29fG3f+7YAspRkfHmhlvcLA9unjimxDV2WGeyIfAQ=;
        b=KtRTj3RuhUpmoiLgKl/p0wBD4l65dXeEbxYpYngHC+q36hx6HQu7oxs6c0ZYyzGW0D
         S141mxjpHqLRt6Y4U4evrD8LaC4NOMLMkwlPGX/q0jyhy35u+qn5ZjVfknI/kRPATycT
         l1HLzp6c4xyLyVAOxFkxtWvNZURLb66Z7VmNjBB8VKxBM2n6dih5/vebVFNYECjngD9f
         FrRTeJFxoBB3OW9HiH3Bl3EdoR4F6va7O0ErFytaGL51wqGh1bVOpZBAG34LTAMAsPUc
         cuWqTnFa0C4v5jUhGgxyrxZuCiPMtwa+rrpxzLsy1VrxlDnErdetc6fBL5poQOQyG4nt
         a45A==
X-Gm-Message-State: AFqh2kqIgDRSFEW02GWPjnsxghtjOJB3HF3/9hwdjb7wTm0ccXgZFx7b
	jJRje0LWyeQKI6oEtf5htTG3yg==
X-Google-Smtp-Source: AMrXdXtdMADeU7OKpTbjIQ6RMUIrdUHWJE7iWDrTvMpa8G4Z24aqdq/bTyQDx/X4qA4YDO9lmzUjCg==
X-Received: by 2002:a17:902:7c89:b0:188:59e2:5f91 with SMTP id y9-20020a1709027c8900b0018859e25f91mr4226319pll.59.1671687174556;
        Wed, 21 Dec 2022 21:32:54 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:716e:2242:a3b5:8079? ([2602:47:d48c:8101:716e:2242:a3b5:8079])
        by smtp.gmail.com with ESMTPSA id k15-20020a170902c40f00b001869b988d93sm12432107plk.187.2022.12.21.21.32.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Dec 2022 21:32:54 -0800 (PST)
Message-ID: <b67238bf-4b5d-dd17-99ff-88b0270ce10a@linaro.org>
Date: Wed, 21 Dec 2022 21:32:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Adding V-ext regs to signal context w/o expanding kernel struct
 sigcontext to avoid glibc ABI break
To: Vineet Gupta <vineetg@rivosinc.com>,
 Vincent Chen <vincent.chen@sifive.com>
Cc: Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@libc.org>,
 Andrew Waterman <andrew@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 =?UTF-8?Q?Christoph_M=c3=bcllner?= <christoph.muellner@vrull.eu>,
 davidlt@rivosinc.com, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Szabolcs Nagy <szabolcs.nagy@arm.com>, Andy Chiu <andy.chiu@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, Aaron Durbin <adurbin@rivosinc.com>,
 Andrew de los Reyes <adlr@rivosinc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 GNU C Library <libc-alpha@sourceware.org>
References: <1631497278-29829-1-git-send-email-vincent.chen@sifive.com>
 <1631497278-29829-3-git-send-email-vincent.chen@sifive.com>
 <871r5sd1zq.fsf@oldenburg.str.redhat.com>
 <20210913135247.GL13220@brightrain.aerifal.cx>
 <CABvJ_xjGZ3S0oAkT08x4DToQFdcUH06omk2OTT1EHDZRJ-2wKg@mail.gmail.com>
 <87sfy5ndid.fsf@oldenburg.str.redhat.com>
 <CABvJ_xjSREsdemJkCJMGSx+09jrNoSbXCwuxF0zEQmZtHrWMvg@mail.gmail.com>
 <d613968f-0fae-1994-3bee-fb10765167c3@rivosinc.com>
 <73c0124c-4794-6e40-460c-b26df407f322@rivosinc.com>
 <CABvJ_xgDsthnm_h6mYowK03VUKqYk=nZsSZ7R=0BTwFHGKEAMw@mail.gmail.com>
 <50c598a6-e3b3-3062-abe7-23a406067533@rivosinc.com>
 <7430f494-9b43-5e03-c1e9-6b83e2611a11@rivosinc.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <7430f494-9b43-5e03-c1e9-6b83e2611a11@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_213257_742280_E0F2E047 
X-CRM114-Status: GOOD (  10.83  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 12/21/22 11:52, Vineet Gupta wrote:
> This is not an issue, if we don't change sigcontext (in kernel and glibc) - it is 
> essentially the case of existing binaries. kernel still saves regs on user stack, in
> rt_sigframe, its just that userspace is not able to access them in SA_SIGINFO signal
> handers. aarch64 have this implemented this approach and it is likely they can't do
> that either for SVE regs.

aarch64 can certainly access the SVE regs on the signal stack.  It simply requires that 
you parse the chain of extensions within __reserved to find it.
It's quite well designed, really.

What you can't do is "only" declare a sigcontext_t and be able to construct a new context, 
nor copy the entire context via structure assignment.

There is room within the risc-v context for a similar scheme, via

     sigcontext.sc_fpregs.q.reserved[3]

E.g.

     reserved[0] -> magic
     reserved[1] -> displacement to "extension area"
     reserved[2] -> size of "extension area"

Thus the area can be located anywhere within 4GB and expand to 4GB.
Not that I'd hope any signal frame would require 4GB.  :-)


r~

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
