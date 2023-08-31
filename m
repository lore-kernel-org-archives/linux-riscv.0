Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC87C83F14
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 00:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IYAs81gbOXzeAalaUW+EM74vlUXbTCmQUtUVA07VDMA=; b=NhY7sn7bhxfyBQ
	fjvB7V+ZVoovWlhr0Syo6Y900rf0Mp6TTp99Rc97e26rugnY5bEljJ+f6YHWM5B0jxp/bXuZU3Ttr
	HHeO+lBvZJ1P+N0V9BGGq2d90o6pGLv7p3RO4eSB6Lsfb0lB1DeNtF++Yp58ut7aXdTxYvgzvarGH
	+Hm5NT/KGqHq7P7WLAuopi5ygh/VApbqc99WVPPvJghbbHqJ7+QEwRFzAxCFquXNAPjH6erDBwaGw
	HMh3nawNx80ssFp8AS7pRz7Q+l1+D1H1FQPBY6l3B46uvem+6G4rDllYLiFS6hf+th731Ez0oyNVK
	10N2eDc4lcb/+xbTE2TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbVA5-00EMob-0Q;
	Thu, 31 Aug 2023 00:03:49 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbVA2-00EMnV-0O
	for linux-riscv@lists.infradead.org;
	Thu, 31 Aug 2023 00:03:47 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-53fa455cd94so267860a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 30 Aug 2023 17:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693440223; x=1694045023; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6VbAFF+mQ3qo4IqvELdDEKnEePt5q/NF9cOLJ4fQs4c=;
        b=lwpFrTbdTqRXZ24M61CABi3+Lo/gKAAnQP5uZuVtk+wdeYsDrPg/7gfbnFoUWrAZQ/
         vx1CVrCtbG2ekKn2+M+2ieqP6nI7I2+pwzmqysGYyF204sSmDXAZ4DVtp+PgROB4tkxW
         wqp7zp7mOi6ZrsuCSw4R6bPLC24SzpGssk+no=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693440223; x=1694045023;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6VbAFF+mQ3qo4IqvELdDEKnEePt5q/NF9cOLJ4fQs4c=;
        b=QSOpE9hY96YpX23vxBzJRFu2m7B2cmneXlVtBJUd4H0xrMq77RfGgbdzJi0eepOQZ7
         MdJujIMeWq7k25K5PzdwEqBLvxvwzfgQjYncwk8goCFxVlBstNlZm053kvCnXTA2dSFo
         hjivb/YNQzd9qbTGE2ANOawxJgltEuC9sVgGY9G+YvJv/aERGbOP6UBMyuf46JFjZflV
         In3sWCHKZAxfpWrW4fmet+5AduKODYrKXUY9kDYoAELzpK8Kvm6U1W83frXpoOZjA7JE
         pzcrmOfs/dvxsMm6MacT5WAf4yP0RPgOzfC1etPQ3NyiWptoAN65US9ewJMw0zWpcEmU
         tQKA==
X-Gm-Message-State: AOJu0Yy6tuiPqDyQ/loApgBuzVLm9E2Wt691yrlsmgKVvLmLiJniZZ1t
	NB1VXnUph1OQNMDkTZOnJNF5SQ==
X-Google-Smtp-Source: AGHT+IGzXuhNKvCDESQE2QRrtYZBrvFQDlCXvQaZKzcZ7GFJqvb5A0aJYkymW5POHQPY6ycQWRimsg==
X-Received: by 2002:a17:90a:fa88:b0:26f:4685:5b66 with SMTP id cu8-20020a17090afa8800b0026f46855b66mr3639939pjb.8.1693440223411;
        Wed, 30 Aug 2023 17:03:43 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id ft15-20020a17090b0f8f00b002684b837d88sm152885pjb.14.2023.08.30.17.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 17:03:42 -0700 (PDT)
Date: Wed, 30 Aug 2023 17:03:42 -0700
From: Kees Cook <keescook@chromium.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	x86@kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 0/2] kbuild: Show Kconfig fragments in "help"
Message-ID: <202308301702.4EB6F55@keescook>
References: <20230825194329.gonna.911-kees@kernel.org>
 <CAK7LNATcTw+btQVri7SBA8gFbDNMYz7D2gMQaoZp9sQGFjCw8Q@mail.gmail.com>
 <87ttsjlmho.fsf@mail.lhotse>
 <ZO2NVLipjlzIh0YS@bergen.fjasle.eu>
 <CAK7LNARjsB+LTBGRfWX68Ld7oehhuBv9SY8scoC=Xk8EJc-OHw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK7LNARjsB+LTBGRfWX68Ld7oehhuBv9SY8scoC=Xk8EJc-OHw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_170346_161136_FF64B507 
X-CRM114-Status: GOOD (  10.03  )
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

On Tue, Aug 29, 2023 at 11:57:19PM +0900, Masahiro Yamada wrote:
> The attached patch will work too.
> 
> I dropped the "in the first line" restriction
> because SPDX might be placed in the first line
> of config fragments.

Good call. Yes, this looks excellent; thank you! Do you want to send a
formal patch? Please consider it:

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
