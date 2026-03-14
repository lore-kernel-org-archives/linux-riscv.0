Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB3B107BCF8
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Mar 2026 08:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EK565l8Ca1lmd6CXh8nPcwG+pbiBF8qcyD5XgaWnN1w=; b=CDCe5OhTOmcsTl
	DOrLKGZ82OfSE6fRMWKQJHEF6BS2lLju7QXPU0IzERzooO4czVT88pkNYrZQ3uzfZQcKNNPwoLa7+
	vWE9sap/GZi/9Jxr6965VQtl/7cKv76SzzYmW8Zh1XByhtWHJxHIbA/mdE1OHWgTqJpcyrdagzZZv
	XdhxnFzNyfa24Nej0eGLCDis/rwqJzOK5UOJFF1uGg7iCfL8PuBB4zqbEss4MlLfuAhYbyL536rPX
	zUUa2y9OUcT1UacMbKcEb7ToE65yIyNzQXW9klgkaUTw+mdmdWQ3ym7MubRZ241/UNk9w+/e0CK+f
	MvKGreQcZgKyya0k5hpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1KF5-00000001ceU-0yW0;
	Sat, 14 Mar 2026 08:21:03 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1KF3-00000001cdz-2yTl
	for linux-riscv@lists.infradead.org;
	Sat, 14 Mar 2026 08:21:02 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b941d924534so365492066b.3
        for <linux-riscv@lists.infradead.org>; Sat, 14 Mar 2026 01:21:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773476459; cv=none;
        d=google.com; s=arc-20240605;
        b=dw8QqeJyJGGygvORvHeAlI8Qz+5eLyYreWbZnO963Afqir0dt4nCGLdW8/oucf6s8t
         i4vfXt/ORMVkdqad29G+dz3nUEvPslFCcyFaSBupqtqlE+GYiepQwOjdf1r65QIAyncL
         DlgsE/WPk1lVsu60jkY/bXZ8dOlj9rWgVn8UitA/R3+z+XMOZ6YdLDJZ6xQ402rn1eXQ
         kB8R5zo6XZLuO6XcyRA97ZZMleLE8vENKiTjXbWeP3TZhbQsy+jfFpQ+WsIEyT7X55VL
         6KHCXp60byXXvFWVQs0FNWwMKTR+UNxGYO8hIjcQ1NAluCxeX1QVU9DvSmFUlYXorWP8
         Zofw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vlKb7klkqu40FzQ6yrehhV+k5I1Bpd1t4GCy3P/aJDQ=;
        fh=GCqfBV/QQEH+ZWkt1ifCy2bUxWrImOcMwWEd2tQoUNs=;
        b=LT8jOM8frXE71TXPbNS9E+151iUDGaEgjSrY1nh5E4DUyULSnZUEhHXN932Menb9sQ
         A1k/gM4OoR+M1RejMRQTZwR7HIw/2DAyfygv+W3DxekGD8O6/IC3IYEk+opoJYw9IWES
         OGpBY2BeeVIGqmMuj95K1XA8tW4DzrRmaE8oFkCZttlXbh+Marwgusy8PvaQ31wZqL45
         /0GHvuyXJ8mMeAAeDsb9sdf8igQBA8KZwZkmoZ8bfsg2wHuF4VhwY2J9WgycpJvqiIos
         fGSQC+w2F6LBLnLZSwMR/NNRpJnBaUlaErSfpG5g/J15VQ93Re8ibKMFF1s8oXHODbNn
         f/JQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773476459; x=1774081259; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vlKb7klkqu40FzQ6yrehhV+k5I1Bpd1t4GCy3P/aJDQ=;
        b=M+f9+FqXrKYoqTaz3xcwaO5KueDssmgnnQoJ64LXPZ1ThhMf3Vn1lHmKyPC2dDXszr
         zxJU5Ns1iw38nCZvTBy96P1gHSREwtSVvqxc3xWCkNeiLaeSNuke5AVbNBoqcp8ezzFS
         MoFffansKmUeZEOvRvoAlKsmEw0HchvxSna5SjCPjjPPtzxPqlQIfMz65SlGDSTVN2f8
         +7/7mXybez81+WxkuvckS0Sfv9wvZhashIjgfiIizVYJnKy+4FgHj3D5IEP4K92SXf6b
         62VpFfeBPMrWhavsjPKvh8R5dxn4TqIvgk1lLp5Gh6WQWUmOv3jiLRMcYTFljCCQr8eD
         tDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773476459; x=1774081259;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vlKb7klkqu40FzQ6yrehhV+k5I1Bpd1t4GCy3P/aJDQ=;
        b=ERO/buTmvvygPejNzOuU+FXUtULE3M87ZEyFwU2lWmZXluggV37G/ctQQCfskzonxY
         8eAFpy279OJCJ0JT+F3ctmRdFRtfkUAHux4G8ZmHE2ghEiHmj3WgF0PRh/sqnBci0jAK
         itsHPJKP3GOQVoTl97NsRfm+40mM2oTfCiah28yUMbSkMXQuZz1Gqy2KL87qSW6AwR7Y
         sWYi7TxzO6f4wZYZ2l/a7Z6U/cbI02G/XZ6XMe9Jae1RQZBKHW3d4LpCP6OPhLjxnmhU
         Q8R77eOOR6ey7h46IxUq9/9bZaDAHK2YlRpGxP40xIEmVoct7gki0pdY7co4Zg0d6i6P
         SMWw==
X-Forwarded-Encrypted: i=1; AJvYcCVfMkKLR1EBeL6s9ytxht9KDcBovK8Arp4wZwpve5y3IibQ7wA8TFiAloRCgsehugm+rPJROTOBjatTyg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzqFkMYGfEjYssu2o67UMqKimXomL8xW6qmnFt6BfjWo8KeFHyV
	dbDZIX2I/IqqZEgRzcxrFU+GVS4Wnp8w62k1irZoONz3cYmu7ttP2rWITlRu/2brPWfrnVRb/So
	vtxMBOL1DPcO+v1FgkDFgRadKd7bQXqc=
X-Gm-Gg: ATEYQzzExpXaGE14eWnEuSaQVNTn21aEigT8IiCHwKcJriY1vWQiIfGPf9wRFbWbAOj
	O5qTsppx8wvSWxI0LPgOFUgpwQTHEZmcA0M6Y+oweOdQ8f6d1C7l8sAqEziS2sluO2/ASmX3pBO
	DflnVjfzI7Hxn066x3+CG564eiYSPZ7137joAFCcgIlzIpX9y2+7utiVg+O4DT1bH/VQb3pmyk3
	sOezE/MDxRmafelfin4Ztc6dD/mWOZcFadt/zDl6RECa/Au/aP1FzfbM9cnm5NDVI55hrBrTtsY
	Ayd3tcoKMIfWkKMf
X-Received: by 2002:a17:907:c305:b0:b96:df8c:42cb with SMTP id
 a640c23a62f3a-b97652124b2mr305792966b.46.1773476458945; Sat, 14 Mar 2026
 01:20:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260312-k1-gpio-set-config-v1-0-8c3541da16b1@pigmoral.tech> <20260312-k1-gpio-set-config-v1-2-8c3541da16b1@pigmoral.tech>
In-Reply-To: <20260312-k1-gpio-set-config-v1-2-8c3541da16b1@pigmoral.tech>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 14 Mar 2026 13:50:40 +0530
X-Gm-Features: AaiRm50vBOSwj4szvgoweRvqZZno3gW1jvqc0W3UsBDtZwZjhBCmdc4MEYz21_c
Message-ID: <CANAwSgQj62=2VFxpUKqXiyNfP2vpPBnB-p_k4_83L0mMQ5oOPQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: spacemit-k1: Add set_config callback support
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Linus Walleij <linusw@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_012101_771315_EC2BCAE2 
X-CRM114-Status: UNSURE (   8.62  )
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

Hi Junhui,

On Thu, 12 Mar 2026 at 14:14, Junhui Liu <junhui.liu@pigmoral.tech> wrote:
>
> Assign gpiochip_generic_config() to the set_config() callback to support
> pin configuration through the GPIO subsystem. This allows users to
> configure GPIO pin attributes like pull-up/down when specifying a GPIO
> line in the Device Tree.
>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---

Reviewed-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
