Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A939AC4829A
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 14:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LHEGyl9RNUGaga3iLISdU+JJqkjygkm6yawzYIImsJY=; b=t9h7lE3aEMl5vKQe/TUgWnrwFn
	HeWxhZHyVSiQ4LoKBRSDSrhVdlQLogcSi0/uuyC4QRAejKCp762zWs1eizDYv/HhNMT/7Pouo9AWm
	4y5gBDHO1Mo4B9rndtU13y3p9WN15MgjR7inUpo53GwcnT9OSIs9xW0X5rZSajunjitH4mK14KuAm
	oFjhUdUMM2KK8uSs6RMFIAoGhDdsgU3KO06I4lk70cFk2rvnvSUUaRqLoQlo3tp9/sNMsIFrGskwq
	kbAGHZ80QAz4So3HTQODADQ+UgftaGGY7jGbjsPY6WlSXd3w3PLK7Eo6BEAEBItUP0Anp1nIWjnJM
	ts9waWbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZuEY-00000009d6e-1krr;
	Tue, 13 Feb 2024 14:58:06 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZuEV-00000009d4Z-0aZl
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 14:58:05 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6079cf3541bso3612697b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 13 Feb 2024 06:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707836281; x=1708441081; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qJbzO1t7Di7Fc9yeiU0bRlmcKokfI8GJJTKI/qQrGOk=;
        b=dVJyYEDCEQGJ0/Y9FrxAKU1c0+g9Vz0avR0eQeYlA2IuIX9VY+64wQGffOcs7YxDGT
         7l0L0iY5CadhYZkhytNcCz2/ETXR6z9KCg2TLjfegdzLyMwRIhcd7nfUVkY6YEum0Blp
         6zb0xrpSUu7Nn8qMFNML9hqh3kbfN841AN28wfuu5g3GLQSmpL3dq0iHy6YUg7PDbkBE
         7MJAh1Y4BS4BBrJDo24NZUNqb0ybo5Dg5Q/n3pHh66YrhvUDHYUzyUnA1O+8jUUtnID2
         V4DCQOeCjdpqgPZznE3tRHH88Ze1k/6wgtCDpVvwqEhZMXvqiBoogYdJVTbaOD/Mtb3P
         hBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707836281; x=1708441081;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qJbzO1t7Di7Fc9yeiU0bRlmcKokfI8GJJTKI/qQrGOk=;
        b=MJ7mrcOh2vDGlN9ncz7cACVUvw/qHYP1swq84YiEhKxUs+EIEiRnsq+3CYt1uXtkVT
         KV6IazRiSe6OtOfBYrwz9u7Q+TryG5dnVUMAM5v8AAacXAfx8x7F1cYutw6/yQziJvRu
         yl9kuwjnm/27lwR4DLIftWhgHu/H2gMLkFiMtqVB7PYAt+0u0UKDMdsy2piWAP/5rE0j
         hybm6+IKi4JW4+ZMzq34GeynsUuNvFC3hQfk/wCEYanMAibDY1hz1Yrxzrcuh8B7fq8s
         JHfZnjUBN33nn2DzRhWXAgXcFd3vlMBYOL18PKjtssjIpYlKqGH1t2CgSLoNVS3LUYYf
         XfhA==
X-Forwarded-Encrypted: i=1; AJvYcCVV44MXVD4VIwqkCWjALfO5cwiCcfJMRnjOX36RzN/3dB31RjPJ15ysyMLTwyk/3PjgGO+JgHzgz7u+BOyhN3Sgsx4TmLMzrbMcmUuafWrc
X-Gm-Message-State: AOJu0YxJYN00i1kXB/yGmT8IlYdUfr6BzPmaa1vYh1C/gXXN8xn1GJ91
	wWsM5QlPykyzlE1MxkprTpjRVe5zq8gPXv7RW4hMEDcEd44WBAQ83AN/0DP7DVd2q/AyW6zYJJ0
	kmk4HRA0reQqhGsJiug==
X-Google-Smtp-Source: AGHT+IESdS8iWPEKgDoh6+53rMi+VNaoK022Qj/k/mqXr7o3EiEDCIxvbGXXPRaKlmahvRCe3k+zmaFHs50bMdLf
X-Received: from ericchancf.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:4139])
 (user=ericchancf job=sendgmr) by 2002:a05:6902:1505:b0:dc7:48ce:d17f with
 SMTP id q5-20020a056902150500b00dc748ced17fmr2564940ybu.10.1707836281481;
 Tue, 13 Feb 2024 06:58:01 -0800 (PST)
Date: Tue, 13 Feb 2024 14:57:53 +0000
In-Reply-To: <ZctGwaTnEfkum50a@andrea>
Mime-Version: 1.0
References: <ZctGwaTnEfkum50a@andrea>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240213145753.2423739-1-ericchancf@google.com>
Subject: Re: [PATCH v2] riscv/fence: Consolidate fence definitions and define __{mb,rmb,wmb}
From: Eric Chan <ericchancf@google.com>
To: parri.andrea@gmail.com
Cc: aou@eecs.berkeley.edu, conor.dooley@microchip.com, ericchancf@google.com, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_065803_215787_F1B69DA5 
X-CRM114-Status: UNSURE (   5.64  )
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

Hi Andrea,

  Thank you for reviewing my patch! I appreciate the feedback.
  Referring to your suggestions, the final result is as follows:
    1/4 - riscv/barrier: Define __{mb,rmb,wmb}
    2/4 - riscv/barrier: Define RISCV_FULL_BARRIER
    3/4 - riscv/barrier: Consolidate fence definitions
    4/4 - riscv/barrier: Resolve checkpath.pl error

  I've updated patch v3[https://marc.info/?l=linux-kernel&m=170783431129245]
  Please let me know if you have any further questions or suggestions.

Sincerely,
  Eric Chan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
