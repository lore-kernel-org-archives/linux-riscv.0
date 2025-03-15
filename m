Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65AAC28B28
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Mar 2025 09:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TwGes+laUgaYDuiwtWQSmHY2TR/VTYR/+L6DdLPnIJk=; b=vJysc/wHVdp1TF
	aDQBLtg7llNk/SdrubVW+cpaa++NOs1vh3ZoMudFFgRTOaFKfpdV1UIS/U0gepHqrZZwO4H7i8W+F
	fkx/Ww2PJBGmUY8h21wJdF2lV3zjf5yHlcN3lNgzjsRjVkdvI0fJbmWE88z/ZwI4wqInhKdk5fHOu
	HOCPCtVXzqTHgL/ymBK71X4E1+qDeHD7O04IEhQlXIP6OHil/tDRecB4kwiVQtguOi/1UIwDuJ9bN
	OM/g15efv2zuWHC2qV/WHJGnq7AdefDoLklOJletJI6TvuK79abMdiv+PawT4eYakiu3BF3NE/tso
	nAPwFTVdRBG13m3JETNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttODj-0000000GB7m-1hOj;
	Sat, 15 Mar 2025 09:54:19 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttODg-0000000GB7H-1Yp2
	for linux-riscv@lists.infradead.org;
	Sat, 15 Mar 2025 09:54:17 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-38dcac27bcbso2597087f8f.0
        for <linux-riscv@lists.infradead.org>; Sat, 15 Mar 2025 02:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742032454; x=1742637254; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0TvVlA4AtYpoqY/Sb7DgHGmCr3kgRMl3cNi+GrJ7x1A=;
        b=cJGAmOiK7cQhb1jr+oxxl4pN36gOQs8ariWO4NlX0lqyVlU/eP+y6erGzFLPavX3Tr
         KNt0j7dDvgTY4ul1g0T8KGTjk26aYdia9Lk/84sXU4DJv46AOsLLEcg7coypcNyXZvrT
         mLutRrGYuzKHtiOuUCwZD0qgon2dXmuD3Z9khforTS5f+P0KTSuo3VzUdYlT5hGZBAzp
         xwZZiC/vT2Tii0KgzxigETndyRzLkq9NZDuPLdYLgQasC5oL99qnsFC7s7PCQVrGeedd
         xQYbtUDlShdkhJ+aYFX+xAKurnVh3wUrAOoCFvHXb5J4HauyMljhovFhO27hiRFYVbWi
         CgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742032454; x=1742637254;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0TvVlA4AtYpoqY/Sb7DgHGmCr3kgRMl3cNi+GrJ7x1A=;
        b=L117vxaXjdjo+x7GOO9S4vKoPbxVOlb7JrxfVeTenupuMAi1g+EdbtF+6cIyHzodzC
         /OVNMZ+qObOAC/ozyv0eYHtRdHwZJscuYzxsI3Hd4WTqfaIB/r6plVUdIVthFiRCbXLw
         t8CN+uUU5dWx8m/e9xb8DapNubGQZrE0Sct1Imo3eh6ulnYOC/e25rukOsjfFAvP0jvL
         EBYqj5P0mcZ/hAoF6DnVUoWAnyEuToCql1ijzFr2a/m5XxWJZBU2sZZfuag0awTS1Vkt
         fDyWuwEnelZjrJ26JZYbfTcS0E7xR0WrwNnl2WK7aTxU6HMKbJfWlUn0VU7FAoemsJEC
         8Pug==
X-Gm-Message-State: AOJu0YxkbsaCC6pvPmaq6t8bz9saOemNwey/h39iqdlrznv4S3fqH4HS
	1uSTT3Iz805pvnzESBdGFUdMEqifbtxs0dJJZIN67ZF+lGitnqQxCQDTl/hVlnk=
X-Gm-Gg: ASbGncv3gre+Xtxn/iaMp8dHbeHL2m7SP0Ta+H01kb4zAi96Lt4ig+jvH+pIygS6DCb
	mqwjAWg7imG2tcapzejiPxGMv03WwO90HIFgDZMpo+brz0v8dlq7U12Xaalcn6gzdXE4rRSMcnF
	Rx4ym/7fn6lklv58UrfcElHNZuoEfcyH5uZ+/hUH2Qz4CrA0bUI/VKE+iH07ZJ4Z5QFf19aK2w9
	1u6GIB4Qq+t9QXlPcVmZFTqwJx3iP77mC6k+Y9HVRCtzehOzQw+ZbtJQV628ue+/6qVpy91Bswj
	1IWlzhvuJ+faeret7dn4f5tmN3qekMCnV95nuH4N+Rn3VeTxpw==
X-Google-Smtp-Source: AGHT+IH125aEBlQkAPSbGZGmYmgRq92mkCdtCtKMk9vY/48Eh1T6bq2hT5yvABpcSf826bhMcqixVw==
X-Received: by 2002:adf:a387:0:b0:38f:3224:65e5 with SMTP id ffacd0b85a97d-3971c3ad3cbmr6082345f8f.12.1742032454415;
        Sat, 15 Mar 2025 02:54:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-395cbbc88f2sm8421222f8f.101.2025.03.15.02.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 02:54:14 -0700 (PDT)
Date: Sat, 15 Mar 2025 12:54:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: linux-riscv@lists.infradead.org
Subject: [bug report] firmware: thead: Add AON firmware protocol driver
Message-ID: <17a0ccce-060b-4b9d-a3c4-8d5d5823b1c9@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_025416_431848_54418FC1 
X-CRM114-Status: UNSURE (   4.25  )
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

Hello Michal Wilczynski,

Commit e4b3cbd840e5 ("firmware: thead: Add AON firmware protocol
driver") from Mar 11, 2025 (linux-next), leads to the following
Smatch static checker warning:

	drivers/firmware/thead,th1520-aon.c:174 th1520_aon_power_update()
	error: buffer overflow 'data' 2 <= 3

drivers/firmware/thead,th1520-aon.c
    164 {
    165         struct th1520_aon_msg_req_set_resource_power_mode msg = {};
    166         struct th1520_aon_rpc_msg_hdr *hdr = &msg.hdr;
    167         int ret;
    168 
    169         hdr->svc = TH1520_AON_RPC_SVC_PM;
    170         hdr->func = TH1520_AON_PM_FUNC_SET_RESOURCE_POWER_MODE;
    171         hdr->size = TH1520_AON_RPC_MSG_NUM;
    172 
    173         RPC_SET_BE16(&msg.resource, 0, rsrc);
--> 174         RPC_SET_BE16(&msg.resource, 2,
                                            ^
&msg.resource is a 2 byte array.  This sets the 3rd and 4th bytes.
It's intentional but ugly.  Use &msg.mode instead.
Also use proper endian conversion macros which don't assume that
we're on a little endian system.  (Although Intel drivers assume they
are on little endian systems.  So there is precedence.  I supposed.)

    175                      (power_on ? TH1520_AON_PM_PW_MODE_ON :
    176                                  TH1520_AON_PM_PW_MODE_OFF));
    177 
    178         ret = th1520_aon_call_rpc(aon_chan, &msg);
    179         if (ret)
    180                 dev_err(aon_chan->cl.dev, "failed to power %s resource %d ret %d\n",
    181                         power_on ? "up" : "off", rsrc, ret);
    182 
    183         return ret;
    184 }

regards,
dan carpenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
