Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0448C021A9
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 18:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G8VlEwxq++/dJpH9iKoPzG7wa0hycCUxxsYzReJLe0w=; b=qCeFPYESKIhIDe
	pRjH96rH3D3ZBjRSHne1AUi1vl3kf1rP8H9aHo4a9B/XqXvU9a1+DVDDJUncsBS1kuJTaek+EEFsb
	gMCgt2pxdNalArxgdM2HHMGYkopdpqo/Kyc1uOTmCnt7Dqc0VutubhIJNQp0gIKVgip5uLKsH1Ub+
	al2rwk3LjP9I91llyzldyn3mENKYgz69xS3Kix7QNaHImXymj3edBk82kUHMBAvQvYMrT6ke7IRLD
	EVmqbc8qsjRfxZ0Et5WwcHgIcu7I+9WwQ+hxKShteF+jN+ggxbvexZn3XqbW9Bz0w35ZdA5xWwIgd
	YVwBOqCYWf4qcThWjqVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk5lQ-00000005aiW-2lU4;
	Mon, 17 Feb 2025 18:22:40 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk5a8-00000005ZHS-1Raf
	for linux-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 18:11:03 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-38f488f3161so517851f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 17 Feb 2025 10:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739815858; x=1740420658; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WYdQMpmWfwfRPZrNOq/JI6U8Fyr73ByGTD+9Af1nU7I=;
        b=gcc8N/XPvKrfVMvrJ5ObQpRi+keSIMVacJZVCJxaPwKNWM1rvtYnijFU69DchoH0TY
         8WP5edx6dUA7lSznjr7GBAiVzD6qltDu+IC9plIFHFZq+qBwjoCbdb9K/x9pXRJCVcmF
         f3Wi/QRzR0NYhOxmNibPZMX6HYJMsFBEorygjcCVBvqgPACfJDrTON9xArwQoRABqlkQ
         y6HUN32LLcE1n1BxGnFxyZk5V4Mo7iPSwq/HdHLqMd20fbZy1sW57OydlGNCfv/nPwCD
         Vs3FGio0oEno+11dga/jc/0oiHCA8SllDSnc3HS8fcl11o+5QthSG6SaPstFoOP0lK6M
         Q2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739815858; x=1740420658;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WYdQMpmWfwfRPZrNOq/JI6U8Fyr73ByGTD+9Af1nU7I=;
        b=ZmcVF2US7tpwGQfMEiUtNWBBC+Ki20e2p1SKq9rCHR+ktc4YrggL4UXmi10jMyDCOT
         mqCsjDxO5k5ATdje8V55sewI7Y1gvqVXfGlKYEy3Si6201MiDlvPcZcUy9y0rZ+G22wU
         5rS86E9UxszHuZrpZJLTx/c+f75T0a9CQfYE84Hm8kxhfD9Ha7dl3z2S12qhR3iNgr9G
         8/aN3IJeUwhFuT9irhz0hXfu5zztu8d3Qxg50C5TyZIs3QObInURD21Is/DCBgd4MnVp
         FbVzuG9yb2bYUpMddXoHeH23WmSBrGXsK0ldC2FheTxAs/48HDTcTXCxXJP9ZJZLru/Q
         cD7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXj30lvqgSV2n4Gn5Ct14IyLYC0nI4INCI4rr0WG+FBzhjRaQL8xXwXDMB7dwdTg4n5Y+tKdtbcpfrU7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFXEAieB+LTabagiN/CZbLSDvZTBFmeE0jyQNahm+dYRg5WnZB
	Y6S1jD9m9TjQ+sZLAGNJbt+B88Lh5tb1wzx3NRIwEz7EbxBJgOfTkvLRLz1wWa8=
X-Gm-Gg: ASbGncv+k4NpJmZlYSZw0BV+vBXzlHfJLgIFLYlmrKzUXQf2FGtT8fjeEHdRQcyOanC
	ZeNeptgoa3y1JlcUmp70PRAY6Z8Km/OITXH470xOMWLXeSfdwbF/YiBD/3aYcbHJRbmHBpM3Eh8
	s1DAc93juunN2h0hE5BaeypbJzLIHSFAS4659qOckQKBQbBz3RjxBiGScP5I73JJ5ITxRihqvmF
	cpMDR32UVckk0MJxpWnn/LOkC+iSwhMTPFelRC7/iEYxdql8c1lgN8UGv9qVc8DD+6n0ykBe5HT
	TjgQzNOybwHDYQ==
X-Google-Smtp-Source: AGHT+IFTAKZ9BquOVY29sEYMChLDnuqHcqVlSqR4NiZlMjD4bUMe9qRI5EU9r/6iyIf02WCX+Y2KzA==
X-Received: by 2002:a5d:4cca:0:b0:38a:2b34:e13e with SMTP id ffacd0b85a97d-38f33f28c01mr7768806f8f.18.1739815856721;
        Mon, 17 Feb 2025 10:10:56 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:a529:8667:e9bd:7f7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4395afaf052sm155075695e9.13.2025.02.17.10.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 10:10:55 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dave Ertman <david.m.ertman@intel.com>,  Ira Weiny
 <ira.weiny@intel.com>,  "Rafael J. Wysocki" <rafael@kernel.org>,  Stephen
 Boyd <sboyd@kernel.org>,  Arnd Bergmann <arnd@arndb.de>,  Danilo Krummrich
 <dakr@kernel.org>,  Conor Dooley <conor.dooley@microchip.com>,  Daire
 McNamara <daire.mcnamara@microchip.com>,  Philipp Zabel
 <p.zabel@pengutronix.de>,  Douglas Anderson <dianders@chromium.org>,
  Andrzej Hajda <andrzej.hajda@intel.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>,  Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
 <jonas@kwiboo.se>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>,  David
 Airlie <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Hans de
 Goede <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>,  Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
  Michael Turquette <mturquette@baylibre.com>,  Abel Vesa
 <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
  dri-devel@lists.freedesktop.org,  platform-driver-x86@vger.kernel.org,
  linux-mips@vger.kernel.org,  linux-clk@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 1/7] driver core: auxiliary bus: add device creation
 helpers
In-Reply-To: <2025021501-tamer-sank-142a@gregkh> (Greg Kroah-Hartman's message
	of "Sat, 15 Feb 2025 07:53:12 +0100")
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
	<20250211-aux-device-create-helper-v3-1-7edb50524909@baylibre.com>
	<2025021437-washout-stonewall-d13e@gregkh>
	<1jwmdsxugx.fsf@starbuckisacylon.baylibre.com>
	<2025021501-tamer-sank-142a@gregkh>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Mon, 17 Feb 2025 19:10:54 +0100
Message-ID: <1jikp8xx01.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_101100_375682_E74B96D1 
X-CRM114-Status: GOOD (  19.42  )
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

On Sat 15 Feb 2025 at 07:53, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

[...]

>> 
>> >
>> >> +							int id)
>> >> +{
>> >> +	struct auxiliary_device *auxdev;
>> >> +	int ret;
>> >> +
>> >> +	auxdev = kzalloc(sizeof(*auxdev), GFP_KERNEL);
>> >> +	if (!auxdev)
>> >> +		return ERR_PTR(-ENOMEM);
>> >
>> > Ick, who cares what the error value really is?  Why not just do NULL or
>> > a valid pointer?  That makes the caller much simpler to handle, right?
>> >
>> 
>> Sure why not

I have tried the 'NULL or valid' approach. In the consumers,
which mostly return an integer from their various init function, I got
this weird to come up with one from NULL. EINVAL, ENOMEM, etc ... can't
really pick one.

It is actually easier to pass something along.

>> 
>> >> +
>> >> +	auxdev->id = id;
>> >> +	auxdev->name = devname;
>> >> +	auxdev->dev.parent = dev;
>> >> +	auxdev->dev.platform_data = platform_data;
>> >> +	auxdev->dev.release = auxiliary_device_release;
>> >> +	device_set_of_node_from_dev(&auxdev->dev, dev);
>> >> +
>> >> +	ret = auxiliary_device_init(auxdev);
>> >
>> > Only way this will fail is if you forgot to set parent or a valid name.
>> > So why not check for devname being non-NULL above this?
>> 
>> If auxiliary_device_init() ever changes it would be easy to forget to
>> update that and lead to something nasty to debug, don't you think ?
>
> Yes, this is being more defensive, I take back my objection, thanks.
>
>> >> +	if (ret) {
>> >> +		kfree(auxdev);
>> >> +		return ERR_PTR(ret);
>> >> +	}
>> >> +
>> >> +	ret = __auxiliary_device_add(auxdev, modname);
>> >> +	if (ret) {
>> >> +		/*
>> >> +		 * NOTE: It may look odd but auxdev should not be freed
>> >> +		 * here. auxiliary_device_uninit() calls device_put()
>> >> +		 * which call the device release function, freeing auxdev.
>> >> +		 */
>> >> +		auxiliary_device_uninit(auxdev);
>> >
>> > Yes it is odd, are you SURE you should be calling device_del() on the
>> > device if this fails?  auxiliary_device_uninit(), makes sense so why not
>> > just call that here?
>> 
>> I'm confused ... I am call auxiliary_device_uninit() here. What do you
>> mean ? 
>
> Oh wow, I got this wrong, sorry, I was thinking you were calling
> auxiliary_device_destroy().  Nevermind, ugh, it was a long day...
>

No worries

> thanks,
>
> greg k-h

-- 
Jerome

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
