Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1465BCD4F3D
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 23:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nH/3YauVZSgrEWCvq3qn+td9yeVC22JwF3/mrvv6IRM=; b=f+LW5XqIAICIbh
	Fq2Ays8bhKNZaclbhgByqBAS6RroiCleS0ZZP7acpEkM9VPZUEGFHk3qsRXaKK2Icvv3e2s1Su4Mz
	YegXfIT7DscczhSqlGuP0hO3hR5KpCIAmmZMW+iazkPONx8+y6wHZ9Wj+OsuGpfxXuGibo31eH1ZF
	NAi9/tji8ClLcw0a5rshbxduFq5SDRrCrkcy0h2Vgky0FCVNSmE+lsADba+4kMer8SKUkFzhhS9MC
	QwsweU/+LVb7SQgjy9zLbKXuMRiPB30rH1EBzkCBYAcGsl2IFrq7lNkeMzxOE/zlYMrLz1HKgoWaW
	o5utwuu6QhCBbDiCbAFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPq0Y-000000066hf-1y3q;
	Wed, 20 May 2026 23:07:22 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPq0V-000000066gv-2D7S
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 23:07:20 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-12c1a170a50so7068938c88.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 May 2026 16:07:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779318438; cv=none;
        d=google.com; s=arc-20240605;
        b=NZBse2xyOPVJ+F4U2C3LTyQUy9IoSr4AwSaf4X6dBPPZPvd5Ap0cZlc2R3YTukh3lH
         YBFdL+THrkpW3E+q5kBjE51zxZQfdSZSp+2dX4GxJG6ZwjixghdUHLweH+SUiiAJMqMi
         bbHIC5ZTPhkqwmcR5lP0YSTgfZUpj4lU1+8yzGk74Jg9/TNxkrxwNL7MiKFl+MBPdSRx
         lu7qYWVC7MY+teN/FJ5HO1N7UK5wCxWEm5EIh5u6RcsBhGpTAH6Ix+W4cI94abY6lz7W
         zglnnMQ7GLJIyYO3nI0kBApbvQPeb/rA0h43de+nL/Jjpy/+PyDNeMAHBKZZHXgRJ2vi
         9HQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Szf440wJQA9mna5vZe4X4TGsRMOC+fSTlsdU6xAYZmc=;
        fh=qIDU67TVRnfqrCeG7NBE5wKHlhC5DcKkZE7D25/MCTY=;
        b=lvqybzx3QLbdXSw97DrPL5/LsYPKcfIr5X59jnfirQ9SqtAG8z2tg+kbt2wJ3zaqFc
         Mhf6CtXSOt+W7RjPnlV/c4YHDPhJCHwur72aPGM4BubBFtR6kCd3EBCa3n1CBsaJtPrW
         3hH8KrYLTny3X4kF/5NC7wlx/oCYIU66bDwk2ipipebmzIWRnVKPPLF8p1ctU8xSHGUN
         nMYlSZHbJq7hW3nX5LfAZTFU12tfXNgpBZBJTk2UIV29lHl9US+BQJdg1Bk0BdW1ytA9
         jcUli1PY4wf0xCJ/Cyyo9qLvm92mfm87lPzxFVXirVOFA2WpFaVXh3CynYhviVwsFba5
         NDpw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779318438; x=1779923238; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Szf440wJQA9mna5vZe4X4TGsRMOC+fSTlsdU6xAYZmc=;
        b=E1uaRfhV2TUvzQvjCgR+xeeOsPMX+U0oW9J6BImTVQ3ohvL4Zx6VNvtmetJZoGjxk4
         tEbfXwrTPGcp3GAzpILQa8H9Z1O6s7DjutRoapXfWAsh6V4Yl2lwx3yyB3gwzQOoX4br
         HdU9PET6i75aHOHg04WeK0MFsdQlx1kTddWbT5opbJziD0j4ASHPa4pzWt3cjXMxEzsa
         9hnl+LdNjuplCMh2N53L2iJNz4sXYaAzajOqhUdzT11ohWAr7NfW8bIiHqZjyAvGW5uc
         i9Pckrl5Bb0HPKLTrgu0YI2A1+4614f1ZT5z3u/GO+s0G35ZGOpmZ/5eV2Pz/s9XTUxU
         MypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779318438; x=1779923238;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Szf440wJQA9mna5vZe4X4TGsRMOC+fSTlsdU6xAYZmc=;
        b=AZYLrks4DXWxc6333XUwNQVmRb8OCAjsJx3cAjkfNJ9Y2mBCNX0yakaw34p3ThzV9X
         9wN1yw91qaAfdmTho94g+LkjkBi3KYdEfHJ3M3s/E391ZG9HUed6ond3zFeYfzc/W9I0
         AKZ4tz7VeFoFAXxYV33ONFYgQDNB1mNzkjJerJNE99Dqf9ukcCRXlXzGBoRWC9IUPORe
         XujZ6wnNicv/f/Fk+S4N6JBz7V47P84Za8TBSemsJufU0XXqIFlqaKXtAfp8OfHO8Muj
         BHgv7cdczZzzX3iatLJdiOCuEiii+nea9GKHroj7D+YO288IP0G9G8QN5A2beg9PZ3b0
         cdbw==
X-Gm-Message-State: AOJu0YxPW+543OOMUQZ+Qn65MOrTJaNqDje9KPCImZwnv2gAR7Qf16WO
	MWygStSe0xwSqulYzbXgDxzsPm7eo+XRRCRdb2bfsZawMuYxQOPgaXv5wwDlhuG5imIPMDhaf3w
	351EBgJRS2og28WiDgCV7eubQCbZl7b85c3nM
X-Gm-Gg: Acq92OG77aSsDTqfyGGFRLKbGkq0vaSUsR7/6NrrdsAu2zxgiZt2P8wXrOeX7U9iQe6
	2ZWNQeGeLfuqxEV9rqRX592eNlO/7+bHU3eP3xIheEOqaRXP3XEEKPD/yh5ejo3dTyPUZkrExaM
	5qjhLxisy+LGHaW7NyHSqqDJAb6EUKiXrW3vzpRJ4JuarXPHs43oiX53nkFKAgHfNy6UzN9EPcv
	fNKW7m+qqWlLVCRu81Ydt+Yt0GD0A3QjtB8K8QmM437KyHLIEmr4BqrbmdEY/qVZU8lYZRM1ink
	HZkCWjgCjLC9dae/
X-Received: by 2002:a05:7022:ecc:b0:12d:de3f:f3e6 with SMTP id
 a92af1059eb24-13632d4593bmr301864c88.38.1779318438405; Wed, 20 May 2026
 16:07:18 -0700 (PDT)
MIME-Version: 1.0
From: Drew Fustini <pdp7pdp7@gmail.com>
Date: Wed, 20 May 2026 16:07:07 -0700
X-Gm-Features: AVHnY4I2g-XJnzr_XzCXNwmG6k0-zouE_ZvTN1ZPscvzr72753mzalMYOVtN0VI
Message-ID: <CAEf4M_DDXRE5v_wN+=XfqC0rs4q16YUSXCJs6VHXHqrL6jP45w@mail.gmail.com>
Subject: RISC-V Microconference at Linux Plumber Conf 2026
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Cc: linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_160719_568205_EFBE0423 
X-CRM114-Status: UNSURE (   4.11  )
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

Hi all,

The RISC-V microconferecnce has been accepted for Linux Plumbers 2026 in
Prague this October 5-7. The Call For Papers is currently open:
https://lpc.events/event/20/contributions/2333/

The microconference is composed of sessions between 15 to 30 minutes for
a total of 3.5 hours of technical discussion.

Proposals can be submitted here:
https://lpc.events/event/20/abstracts/

Please remember to choose "RISC-V MC" as the track.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
