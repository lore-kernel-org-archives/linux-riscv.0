Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA4CC433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 19:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VL5jwcYVh02ZA0bi1ReBm26s0PSAVYwaFr75bV6b0Pc=; b=JlAzkRLYjNRUxUb05MUP4cMaMM
	0XvuK4XDy/5Hz6HW5ndOXX63tx+NarsPUitVY6iC6mXrqg7ADxHzw39WfQ2FjlFBDHaY8c2c0RebT
	WjVLj1WlI9WHmZfqi1zIjf38lg5Rqgizi744rwF3Z6nsNZW3lwgg+xuEg8Lelyk8PsQBpCazlcMtG
	owVDyX4oZOZjxCNvextLUY0SP9Xn9ekhOjIKX3vH/vJXnOqx4cs7QpSkylIjyF1fME3vWnuJASfUs
	2z/9RuePkyDnFIGdvWxMZR0BQWHo9hnxYhkox/8jPi5ET9LLUmb7YFO3WuBZR48c+Jen7u0mt0kju
	10lcC8nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogWRf-004ixx-Fy; Thu, 06 Oct 2022 19:22:11 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogWRc-004iul-Mv
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 19:22:10 +0000
Received: by mail-ej1-x634.google.com with SMTP id qw20so6121477ejc.8
        for <linux-riscv@lists.infradead.org>; Thu, 06 Oct 2022 12:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:reply-to
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=FbCkYi8dJ9ElHGRGQt2IFM46+KrPD5fVaRWOGONLaDI=;
        b=eqWRPJ4HyBVUM4+6GoAvHy4kjyK9v1ZUs5Ons4ffZEsXlhK6Ne6o7Mzcit8PdgE+Xt
         24oPi0+6Ez3aPo3+9gPE50mIIszH1cDgnud5YhcW11KePF7SYn1356pm7nJx122iVRLX
         rxh2UUK74QiNuyyRb4eAVUsWqnzB7vn/226X2WdNtgUjxyZemYwoonEG+ctubW6ZHdyM
         a1W6NfhWB7pR58Ee4lhMnRsO7MzSS+SlWYVbBF11dcsOgySwzTs/9kYo64C5rEAVUjpQ
         qhUutSheeALu0jsswGCnXm1yip+FYEi0BIYXaamRGHpzmQGlDAPTPGUe1HM5wkVXdy8x
         OhzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:reply-to
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=FbCkYi8dJ9ElHGRGQt2IFM46+KrPD5fVaRWOGONLaDI=;
        b=amaS7GsxuipxGzGtCpWxA5IOHdICQWzpOyh7cApCuiU7B8b+DLTBD6IaOXkafN2BuJ
         bjQkSjNqTBdxlWp60riKNlgmgF09fh8k0dgahUrAJjrCjfvd/hh5SLFX0WnvUcxXku2G
         Q+pTBRImHAKMF0AlJuOyZhCveXwD7/Ey4TYdAEu9mhUYIwc4nmWa2AScdMUc/QNdnFrq
         iV/+In8uOSO5TuxVwJKb2ysvcDJy13hvcZT+QHtuIWlTgmEXlhXkwACM4iiWIKFlSDHL
         oEQrA+Ui3nt9WemV8cyJmLwRVyzJQlnFpGFRBAqXJnhyMoJ5d9WhAH+tHy7QjGYPHFwc
         5TZw==
X-Gm-Message-State: ACrzQf0xj5m+hVcYKs6DjAhhI+8UVCC52XBA6gKoj4eVEP31Ulek4uPR
	/ykZtCj5K1GCWX9b1Df73Wg=
X-Google-Smtp-Source: AMsMyM7doS7nEQY3Y8s+h2PLBdkj4Kv3mIC+pyGjfrvz9J4PU8EPx/xkU/1nwwlysoupEXw11CUw7Q==
X-Received: by 2002:a17:907:7704:b0:780:da38:4480 with SMTP id kw4-20020a170907770400b00780da384480mr1208281ejc.64.1665084124312;
        Thu, 06 Oct 2022 12:22:04 -0700 (PDT)
Received: from [192.168.0.100] ([46.219.3.46])
        by smtp.gmail.com with ESMTPSA id ky21-20020a170907779500b0074182109623sm133208ejc.39.2022.10.06.12.22.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Oct 2022 12:22:03 -0700 (PDT)
Message-ID: <77c9a7c1-b930-b8f7-7b38-b317ea5e929e@gmail.com>
Date: Thu, 6 Oct 2022 22:20:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: coelacanthus@outlook.com
Cc: c141028@gmail.com, dramforever@live.com, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, xc-tan@outlook.com
References: <PH7PR14MB559464DBDD310E755F5B21E8CEDC9@PH7PR14MB5594.namprd14.prod.outlook.com>
Subject: Re: [PATCH] riscv: mmap with PROT_WRITE but no PROT_READ is invalid
Content-Language: en-US
From: Eva Kotova <nyandarknessgirl@gmail.com>
In-Reply-To: <PH7PR14MB559464DBDD310E755F5B21E8CEDC9@PH7PR14MB5594.namprd14.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_122208_760401_3E6CBAB1 
X-CRM114-Status: GOOD (  10.34  )
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
Reply-To: PH7PR14MB559464DBDD310E755F5B21E8CEDC9@PH7PR14MB5594.namprd14.prod.outlook.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 31 May 2022 00:56:52 PDT (-0700), coelacanthus@outlook.com wrote:
 > As mentioned in Table 4.5 in RISC-V spec Volume 2 Section 4.3, write
 > but not read is "Reserved for future use.". For now, they are not valid.
 > In the current code, -wx is marked as invalid, but -w- is not marked
 > as invalid.

This patch breaks OpenJDK/Java on RISC-V, as it tries to create a w-only 
protective page:

#
# There is insufficient memory for the Java Runtime Environment to continue.
# Native memory allocation (mmap) failed to map 4096 bytes for failed to 
allocate memory for PaX check.
# An error report file with more information is saved as:
# /root/hs_err_pid107.log

I bisected to this commit since on Linux 5.19+ java no longer works.
Perhaps some fallback should be implemented, to prevent userspace 
breakage. It is currently documented, that at least on i386 PROT_WRITE 
mappings imply PROT_READ (See man mmap(2) NOTES), this would be a good 
place to start.

Best regards,
Eva

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
