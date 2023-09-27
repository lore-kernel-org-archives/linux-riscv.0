Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D069CE7F150
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 01:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RuEXl0wOaqaSADdAk2/v7eMOc3xfmG6e0jwF2fmJWGk=; b=ipTF7RbCDJdl1G
	hqVcvbLTTdv/0Yuboq2yWx1nSFhHrYBZ2gRLG2HkamN9oPzOsOY8m8tcaxMgJSUe5yNeCelhilvUc
	E3owgbhG135txmQ5hSV+AR5PGtlIJPrzhvbgckfrTAgzOPcLw0qSWjxkpvvOrjkKxLPgT9QpsFx1/
	ciG26HgaDHrLUaTPiTOGhUo/eBBSevZs64aKxOVpcGPRjbRAEjEpME8RA15bwGNWHm9E9/BetCT6K
	X6oaptq1NFyTFJVO0Lo7JSRpXJAd1bdDkyM9JOoS7JNMfkKzV2zjPBt1r5ZZaH2iaS4iFiec446C7
	zDErptpnraX/9o/BqhJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlJCF-00HIFU-05;
	Wed, 27 Sep 2023 01:18:35 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlJCB-00HIF7-2L
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 01:18:33 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-351265d0d67so5547325ab.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 Sep 2023 18:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695777510; x=1696382310; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pSK45h5LTS9VqkVC57gaj2Wd82aeyGKZrEYe4dJCVic=;
        b=GmMN9c/N5fi5ZlQE2OVr8oB817bTCtkeR+HtZzQcXamBNeHdi3uuy1OZP0GbZjnptE
         0Tlja83AQWFJc4ir6Am6aScZ7jq+YlhE77f7R8WbQbwVhxmKE0XTZ30PCD7bA78hFmRR
         4tWSzMkTy1Ay0CYuZTSg44+y7USI28/dztkDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695777510; x=1696382310;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pSK45h5LTS9VqkVC57gaj2Wd82aeyGKZrEYe4dJCVic=;
        b=fZ4W9p2fRYgegcyETiP/TY/nzOLGFbTFQNv/vN8dtIe7jonrrapKn9zWRZ/xspjadl
         y7oGbXXBiVPEza3arogdhptoRJ5fpmnd3sqlD50381f2KWoaZwYh48Q96O5bz3tos6qu
         9XVBpFUW+M5W1BD5QmL6q2tTfAlcdP+B8TSMHNn3R3C9l2BfwIfGmDWrTtiLiNMhHbpW
         lfXH/nSbS97F2Gx8J6lw9U47SrGkQGnwp9/aMyKmHOqc51XK9ge1wtlca7ZyBoslJq3V
         YO6Tx6DijN6X+DozIf2JmLqLxqtFa8osZ+Tt4mWkkhXVPGQ508fcuu0grPTSbZlzUpYJ
         ci8g==
X-Gm-Message-State: AOJu0YyYhNROR7ZLjasQgZwYEOLK+DfZR/vl8ekuwHexcF1+uSmoobqq
	0kHAAYxNFrtVTCM7BxfNSqB/dQ==
X-Google-Smtp-Source: AGHT+IE2jaCutfBvakslg8GPNafee+TlzK+8frCnXrODTVfbk9z1YRbburEMP7cvS9iSP7ZFw0fvlQ==
X-Received: by 2002:a92:cc46:0:b0:350:f353:4017 with SMTP id t6-20020a92cc46000000b00350f3534017mr614948ilq.0.1695777510062;
        Tue, 26 Sep 2023 18:18:30 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id y3-20020a92d203000000b0034f3220c086sm2389624ily.12.2023.09.26.18.18.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Sep 2023 18:18:29 -0700 (PDT)
Message-ID: <fc915b30-5842-5851-bd76-71c2133685b9@linuxfoundation.org>
Date: Tue, 26 Sep 2023 19:18:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] selftests: Fix wrong TARGET in kselftest top level
 Makefile
Content-Language: en-US
To: Juntong Deng <juntong.deng@outlook.com>, shuah@kernel.org,
 mic@digikod.net, brauner@kernel.org, keescook@chromium.org,
 tony.luck@intel.com, gpiccoli@igalia.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-riscv@lists.infradead.org, bpf@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <VI1P193MB0752596147F224B9F921C85199C3A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <VI1P193MB0752596147F224B9F921C85199C3A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_181831_791056_543220E6 
X-CRM114-Status: GOOD (  10.30  )
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

On 9/26/23 12:03, Juntong Deng wrote:
> The 'uevents' subdirectory does not exist in tools/testing/selftests/
> and adding 'uevents' to the TARGETS list results in the following error:
> 
> make[1]: Entering directory 'xx/tools/testing/selftests/uevents'
> make[1]: *** No targets specified and no makefile found. Stop.
> make[1]: Leaving directory 'xx/tools/testing/selftests/uevents'
> 
> What actually exists in tools/testing/selftests/ is the 'uevent'
> subdirectory.
> 
> Signed-off-by: Juntong Deng <juntong.deng@outlook.com>
> ---

Thank you. Applied now to linux-kselftest fixes for the next rc

thanks,
-- Shuah


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
