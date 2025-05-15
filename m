Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D006C2D0CD
	for <linux-riscv@archiver.kernel.org>; Thu, 15 May 2025 09:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a97wUA64bpv08RIHGAMr7JuIo59f/3m89S7rTaykqvo=; b=KiDFeAX3XiUv/N
	2cdz00nO5OXESUVYWx96uaQZ51QOwVL6ZFl08Tx6TIiO94PoqOyI2jnaXMUgnevaUoN9ZiX82egvx
	kY9i0faKbhxBLJzkz2EjUwVQf82qA0l83G1cO88j77OJEvL4nrJRD69q9KgivWsGndIGBkhgtpMQZ
	QglnHJ0uAjrEg8avDXXCWA1iZ4EMdmyaPvu3G7aYBzPByhKKVyXO4olG9Vz3xSpmSbgp38ybyV4+9
	zvZvs83Z/P9j9Kd+BkjF2UvN2yw9XWYzQBTBMKkfXeljhFZUMnkU2ldSX/UTCrZEwHoKNOpvCPQWR
	529T0PxlzU84YX6IX8+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUZF-0000000068e-3tUq;
	Thu, 15 May 2025 09:07:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFULG-000000003Ji-1fOv
	for linux-riscv@bombadil.infradead.org;
	Thu, 15 May 2025 08:53:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=nOVoQnwWT25lQttWoZH7JoBjuOJGRtQg1frpngi8VzY=; b=Ro0CJB5paHW6p05Mi77lguiN00
	PoM4kEpG26712N3v1uBGDbjAzDhPzWWHWg+8mxz8gwaYgiEo1xr91ZKnsm5KcbaN5HtAijJoARfbP
	R2Q8NJbzmjTGXA1gZR0I0SHUksllTTv7oWDAWRyqb2HU67NzVkxFKhymVKoXXM7qZz9YmQYFtHAyP
	ZOKHCiWrwN9gWjl60l89XfgwOaMDL4RvHuVLaSMi63n4T2BPbgd0GZL7LDAsUB5L6tKZKXrLYMgFy
	AKusOGvcuvsZehVXHx5CvpJzqI8hAhG1xLlGuLRynXZzvvP5/et2TXNr3nnC7fzj+zKo4bvOqm6n/
	mU6VxboA==;
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uFULD-0000000HQ0m-0tAd
	for linux-riscv@lists.infradead.org;
	Thu, 15 May 2025 08:53:25 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-736c277331eso1605632b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 01:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1747299201; x=1747904001; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOVoQnwWT25lQttWoZH7JoBjuOJGRtQg1frpngi8VzY=;
        b=YsQWGrpIDh9mLa75/l3luUuj4WoxGHZCRBTxkbmtiXyu2nrXu54+trMCT6i0RNzb8A
         TtzZYL3lcliiHtCVWYywgxgFXyhWqPHxn4z0F1gc0FrjBmb/4xcPuZBpbjfD2n5qbLMs
         6jYJLENIN6DQsU3GuyeEYizWCUELE3+nYy1rpC5Jbtocvyduv6I5xtmXgxq09Z/UsFj9
         2nD8rAwgV7oRpBOtB0DI6Qkq5+ygQfpWMW3nPWgNYZBLl2A/qyhUj6BwfHtsirsnc2Xg
         LqanLqhXGpwACR4a1IPcpUMFwFfi3TuY+AoLOJPsJSw1Pgj448jtw/7eXMK6VfJlPPX0
         UXPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747299201; x=1747904001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOVoQnwWT25lQttWoZH7JoBjuOJGRtQg1frpngi8VzY=;
        b=KRLaP2gTg3/dtxC1lP3R1Z7/0/y07RvTg2h9LWb5g/XU/jNThlZHpZf/WHgz8YdaBR
         KdrUauC2iHD/RByldQ84vEA7mKiiNgvo+P6xl9vlOg48q+Ncfy5yXEGQri4Rek6/FtEx
         Bec4kKANHukosCL3eKmruBGn8LVtCXl8zebVzOI5ajRO45/S1UYBmEDJSWQ1ilNPFFLE
         w9rhyiFUsEycmeGVBKZ7Eiq/KTSd0TJn17ys7R31d7PwOQN7wPYGuMN6c4KV7fWweeYT
         Yhc82pbzpKNOzko6oQDF60OOf0zS2q0oPJj1qDYqVWEeqe2N9DqlOjzG6wfMLZ6wxwGv
         oQag==
X-Forwarded-Encrypted: i=1; AJvYcCXHRgr78qQe1x2ekL8fQogIs86vqy52DR4So76Y3sh9P9TtJmxYOXGTHWEwevcbmSJyy3sr/ikQjlUtdw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxNwIm8rioJnSFE46s28oCHZWZbMBu/tnwE8NqSeQtfXF9Wyksq
	Ttvbikx/qp7UIqshDhWjAoWVPAZhEDvw3BZBbUhfldzHXhh7PBHiDVEKqycZn4I=
X-Gm-Gg: ASbGnct/Ehu+HDr8N8BIIlsrhv924JwqhJfOxuwAOufS2ak8DymTfj6YDzhoq5yRp14
	Plze2/Kmvsm7WzDTXHQKFB4cTYLHdYbTG28x7SVW4DLCVMXxkSdc2PH90ln1HElnFyFQNwh4o7J
	54MmT//fVk4nc7+kdhaRFfJwQN5BUBVNG3etAb0zlL+033WXWmGxehxQc6PF8jv2CYWv/7zm1wW
	pzhhOksePmn8aOTLtVdl+2lG/A6Zs2fDxKzQfFJHPx1NtNDXNvzk4c+c8h22W0dCimDbGidYvwx
	GzrxZm6xorNdCfqIdAPvBcqZLDPw37FgXHXQxkUNdHOwhcGgTu+kAk/91bRNqX6viDlLpE4xei8
	b9Jh1NWNyUBa2MMbJcOhUQBW0TkZv+SbY
X-Google-Smtp-Source: AGHT+IENsPZ/AMQVPFzwdzV24c1hYE73gMI1F84hexuGBFYoNLNqWR0VXSlco8GETzsjYyrN3LMd4Q==
X-Received: by 2002:a17:903:1252:b0:21f:2e:4e4e with SMTP id d9443c01a7336-231b3970b19mr36155395ad.5.1747299200653;
        Thu, 15 May 2025 01:53:20 -0700 (PDT)
Received: from localhost.localdomain (60-250-242-163.hinet-ip.hinet.net. [60.250.242.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7742f3csm111237665ad.99.2025.05.15.01.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:53:20 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
To: chiang.brian@inventec.com
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	corbet@lwn.net,
	jdelvare@suse.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux@roeck-us.net,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Subject: Re: [PATCH v7 2/2] hwmon: (pmbus/tps53679) Add support for TPS53685
Date: Thu, 15 May 2025 16:45:40 +0800
Message-Id: <20250515084540.1558914-1-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250515083706.1554823-1-chiang.brian@inventec.com>
References: <20250515083706.1554823-1-chiang.brian@inventec.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_095323_329078_0DE8D63B 
X-CRM114-Status: GOOD (  16.56  )
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

On 15/05/2025 08:37 GMT, Chiang Brian wrote:
> 
> On 14/03/2025 07:11, Chiang Brian wrote:
> > 
> > On 14/03/2025 04:28, Chiang Brian wrote:
> > > Add undocumented tps53685 into compatible in dt-bindings
> > > 
> > > Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
> > >  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> > > index fadbd3c041c8..c98d69facb48 100644
> > > --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> > > +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> > > @@ -380,6 +380,8 @@ properties:
> > >            - ti,tps53676
> > >              # TI Dual channel DCAP+ multiphase controller TPS53679
> > >            - ti,tps53679
> > > +            # TI Dual channel DCAP+ multiphase controller TPS53685 with AMD-SVI3
> > > +          - ti,tps53685
> >
> > There is no user of such compatible, so how can it be undocumented?
> 
> The following link is the patch which I would like to add support tps53685,
> and I think it is the user of the compatible:
> https://lore.kernel.org/lkml/20250314033040.3190642-1-chiang.brian@inventec.com/

Sorry for the wrong post, and please ignore it.
Thank you.

Best Regards,
Brian Chiang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
