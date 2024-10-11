Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5790BD0D795
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Oct 2024 14:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oxGJd6XsPEvOtVpgbwwQnylqSQmOQEQHUJaH6ePMRHk=; b=Masldx4IjGyOX+2Z+BSy4BargJ
	nSGUHB6ERnOREQXm/rY6DxzzAqGMw+HiZWvhPH3A0azfEhBMF3BjZetOylV+AJ4ojnsUWqLipO9HH
	/VtqtUCZ2Y26s//0SrYMnFkP5O5FxLDkE9e2nh94NaTs13QSX6ICe/5AY644ayxnMidns2KleCAd6
	9qRHURs6uIM47ggPQsh4M0WSatRTpSvdwTyQC7IKAxcp4yfGllq4ECfhGRaNcCtV0nQ/MDOiuYWS0
	WVIHnwuqq1iYW/IvrYGJw7DdjCnH0JJQHZ1OO2HEmIjdtRUKxiyIlQEc2gaEi/9NsHIXQ++YRGLnG
	hPts0kKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szGm9-0000000Gd43-2YkU;
	Fri, 11 Oct 2024 14:37:53 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szGeW-0000000Gbtj-0HpZ
	for linux-riscv@lists.infradead.org;
	Fri, 11 Oct 2024 14:30:02 +0000
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 686CC3F371
	for <linux-riscv@lists.infradead.org>; Fri, 11 Oct 2024 14:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1728656995;
	bh=vwO3jmVMZ7ui6iaiD0TV8NuJtopueyiUboqUU847GRo=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type;
	b=U1NRcsax8FSAvnBEFRZOc8HF4INfQ/foXk97bIhG0PPsUbmIJk2U3ZZaNDx80kGa7
	 rhYkFuntZ4JxqKj9T0w6R89cB+2Q1tCoRwejeqfF1R6JmUNDTHO08IvlA3iXlV7+p5
	 QQyLENIGpWVDPjRz9JPXz7qG/4ZbLFOv1iUFyyORhJPSvpafxPnwA+yuXApbK6hppw
	 AlvQkfDZPA6EjblMmMEwdd+Mdw+rQdlV2vgQ0gTB/QCa90uCXEUJqaJWgOKstMBA7H
	 jTKqm7D/ilT7cIToU65p0h+Ni1EmzcFB9jb/u61ZE+B0MycQkYwXnrjiG17E9UDXKo
	 SN/oQ8e2Re/4g==
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-539947ac1e8so1974798e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 11 Oct 2024 07:29:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728656995; x=1729261795;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vwO3jmVMZ7ui6iaiD0TV8NuJtopueyiUboqUU847GRo=;
        b=ZaE1wO32nmsBAkdBDndnwixZisq8eenFL3s9OlYS0nr3tvWA6DkDW3kLD/JvR2udVW
         OdoNyobf13sKT/h9h0eX4RfYhobSO10c2PIqj6T5jJv8I1absQ3k5MPTMBPEMHXyBzP/
         y1OBXS+hJePXA0cmTLcLAQhhNOcKXPzZMcic09UffvYHOQptKfmo4swoP5j76LMnHIHA
         aSlH1j0Qcx1kBj0odIIi3EWao7xawUYck0DteCYN0RLLYfEFUoWCc26kKFzERqpm78ky
         MSyeH0PAVpU/cLtmsuQ7wNM03QfRDX5vxAW07Ud/Sl16fJHHMHDz71LWbbRygrweBI6w
         1CLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWD/zq6ckZx8b05VugvLWLXJaWeapA5M0o7Q+fcnQGX8ZWHtEXT12UN1bhunS4/pzO4N8mBIX3vMcmCnw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyBGt+yCDJwQ65CdKOBSifq6tLYLw11r8rTrs0UZHQ0n+2WEnqg
	6uB/a7wjl7huC/l3KnT/w1Bco37HBbaxd93xvMbSXE9K+wVXZfRkoXzIQ0letGybojkBLEd6yFL
	H9/upc3myJOOeD+9dtHgRKYgsUb1377kVyIKi4aZd49r0ckxtz05tIOczykAnbNve0OYpC6HKvV
	ulkxNuhA==
X-Received: by 2002:a05:6512:ad4:b0:52e:9b92:4990 with SMTP id 2adb3069b0e04-539da4eb2d2mr1326201e87.32.1728656994631;
        Fri, 11 Oct 2024 07:29:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETCnloaF8yL4RTVBTXsSTo4FXahxxMpz0gwquhY3iNMOBS3HJp2pAR5srONzAyXoDbdzV81g==
X-Received: by 2002:a05:6512:ad4:b0:52e:9b92:4990 with SMTP id 2adb3069b0e04-539da4eb2d2mr1326170e87.32.1728656994043;
        Fri, 11 Oct 2024 07:29:54 -0700 (PDT)
Received: from ?IPV6:2a02:3035:6e0:6374:1a8a:f93c:bf3e:37da? ([2a02:3035:6e0:6374:1a8a:f93c:bf3e:37da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431183065e2sm44191925e9.28.2024.10.11.07.29.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 07:29:52 -0700 (PDT)
Message-ID: <98e7abdc-f7d0-4b97-b9d8-89a9534d4ccb@canonical.com>
Date: Fri, 11 Oct 2024 16:29:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
 Jeegar Lakhani <jeegar.lakhani@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Huawei Dong <donghuawei@eswincomputing.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Gordan Markus <gordan.markus@canonical.com>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: Updated SD-card image for P550
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_073000_464654_BEB8BF88 
X-CRM114-Status: UNSURE (   4.41  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello,

I have uploaded an updated image to
http://people.ubuntu.com/~xypron/hifive_premier_p550/20241011/

With Pinkesh's updated kernel the crashes in Gnome seem to be gone.

But OpenGL is still not working. glxgears gives me:

Error: glXCreateContext failed

Best regards

Heinrich

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
