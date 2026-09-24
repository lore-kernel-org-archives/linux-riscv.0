Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314F5C9830E
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 14:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zqyYCvIakNhssSw6wXM+1ZVbyYQMC/2sdXRUjj4akjw=; b=Fyprlcpcz/6fmZ
	2DgnigQuu+qb8+Z28ef0ZbF6KeMk5gzbkn1ITCHi0AwyMwbGKeIFhXmiZJi+RQAptrPQsnUCf0thi
	2Yc9zrCGsGDbOOgtSPtHVrfrUUeRRElUIIkbBbLnwOda9TzUNP5efCogR3RGzfZaGbycC2ccGaa56
	KbcKkV4t4xRBWawTcccuOxS7gDHzfCAzOZ5czXRnSu6ehUWkUCHhMgPjo7zdQ9dK5zfC0II0ak/MV
	M4Q1WiVa5D9gY5EhoFOaXZ5oTvCzUs+QBPrfq1/P+WLPHQJonwSklvAdtvRfqBQGdcCQEMvdjYbjn
	s6qVvVldzC56SYEUuw7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9kCd-0000000BDo8-37KG;
	Thu, 24 Sep 2026 14:13:35 +0000
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9kCb-0000000BDn7-0CPc
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 14:13:34 +0000
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a803458ba0so2784041a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 07:13:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790259210; cv=none;
        d=google.com; s=arc-20260327;
        b=s8EE87HXosw5+hfJt8n4RqRK44KMhpNN/vgsW5o7/MVtNwQZ7LHWMhRVCjDMq+gIOF
         BR9Du6T66f4Al4U3yjchcIgMf57AdOZJ5tnl2jgUGCF6iMp9Pr+REiM/qNQoS98uxk/P
         gepZ8eWCr81OKlv76imWvL1wmrdOjst5mjd8UJ0MarrNe/YKw+kV70N7Lzv1tzjntc57
         ZlDTPY7sQ2xRP/uj496x/rJLY9uSVhNDbtQXsy1ToSbKIyX4SlIygJKHNMom+p7eq+Yy
         yK8jjRQTyvJXmalY1+GmYiFdcqaYngk3Rx+M59Wz3y3U/nQg/5qg6QebwrEqQZFB3PNm
         cb8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lKB6Rjz90KQTF5VbQz6LXHB9OgSHptSq81FKTHCNTiY=;
        fh=ZJe4FYgu1fMoJhmZAKQOQnuZFoKP83sr0RUb77RbYyI=;
        b=IXugboibV0/tnAolX99zgdIXTG/fr5Achadbq1gcekp+F47Kw0aHC/hiSGEB4aymq/
         7EZi9vTtixpCyczN2fZV9LgSOSP9dpKKtJOz+eXLGK7N+uYNL/7AKpOVt7T6NJyZRc7N
         qj1MzBJTobANNGbjvnmt2hZCrj9Ha40Pp54S56UaN1SmoYNpf0VxyGqq5kvhsB9c6baw
         wp0qrGDKh4H+Bs8j5DsWKn+Ta5GTT+/EtVA9YItiVK9dqjhCEF98tIjEbeP/zqyakCi7
         AcY9mWOpyyEbHF2daUzGAm5kApLJcK3VPBN5XHwwl3x48vg92/Oej0u8WjSUqyJ9dxbE
         osTQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1790259210; x=1790864010; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lKB6Rjz90KQTF5VbQz6LXHB9OgSHptSq81FKTHCNTiY=;
        b=Eg3GH3OJfTcbYDmqvj4n9y8iywUcL7RV6AmnL8pu8ZHtc2EELEWKry5X9VbdUOtoVp
         W2pNjoL2qFAaaY/G9mrJDOnujz7twG5EBShr6oBWn7Wm2tLljYIV0wnO+pkDvnFO2CnZ
         OVLGQYXYX8BnfiIwOw9D31FpxeYgc0AWkJ4ZXEa0mkUou56O8sNXr8Gh1CwVjH7uWb4K
         zjJv6q+BM6GxgK/RFDobM9j1l/lpBLyg+/df3aale5Mmlkr2u4/JEOSSfVExp5S3Dl4p
         jlu/GIhIXTKBKLMgu0fmCvfDDLbZ9xp1xsU3aaslJPBHfFcWVH59TeaCEPYWUt2xl8kb
         Z5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790259210; x=1790864010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lKB6Rjz90KQTF5VbQz6LXHB9OgSHptSq81FKTHCNTiY=;
        b=ndh2mbuG41oqLDvAHoUSQNlkgzGyGRrb8Im6X3OfbKselWquzYLVZhZXHAmUfe06gJ
         xiCC4U2VFny8jjMDIisErD93YmR9QL5bFhELj0GT2hO967DEIiLxOzwyv5sZ55X7W9+f
         +mIZtx9T/v5OubmnbtdUrgboJC8kt21TcJcoIlRBfPvz9oUiZwz1T4Ysf8HgyIHZj9Va
         TXq/BZoPaO6e9uTBa18jtXN835jqzaX0j/+suRk/ZF2Ijhz7Tp/2QWsrYcZN5hzde4GS
         RL1UbqIVT5zhj9XD+T7GdF44hLOGWldGZWgMxHwrFshgFxyvQymSHNMMFmbysZ0ng62/
         C7iw==
X-Forwarded-Encrypted: i=1; AKwUvBzGKMExpVPCWdEr2IdrJmsagSjyzLLS8qaMK8ZOuqFENKNKyWWOWFUm87fk4z+LCBgnMTL87bjeQoZnmQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mPtFN37ANspcrVoNNERm0psoPBSMpBU9hsYQ6FqBHpLjhqD2td
	EmOOC6XOme2e71V842TUervF2p7u4NlXs3lloCh8/6Me9gzCgPKjbc37xNjlbTdp8/RF5kEVt7J
	dehF0cQD0HvrQOOXxoGuaYfP2S0ZMTtjORIT7oaVfpiQjVY783RzPt/Pz5A1L
X-Gm-Gg: AYBFou01jE8cGkFwlGS72kxGJgIE/q28CkhQ4XzcZg/2Y8Z9bMX55WYd5awgG+aGKB/
	HNDRDNxuOyFJ+WwClJXxVV6tRGApzxTULrHfplPlYzvq9AaQRADa6xBiXLbETzkw6v1lZUzVgmb
	SC/P92jEKu/CK8kOhOwD5aWHBo3urS7qPfPtAEofe4X1MqzGTHGfqaztGwPvF9BaI012CQPTa5B
	g6dgqAxHLlKchMUpYXfvEbwNDcOu/cmiVSBkpIVC+kvFcwZ2EXzcGBuuZY87MvbB0P9qVJNaFCh
	GEOvpErOEesghVTVjAJW7bbAlFCF3zy112fmFFqPYM6ME7LZL/hLmN3p0A==
X-Received: by 2002:a05:6402:52c9:b0:6a9:984b:4c71 with SMTP id
 4fb4d7f45d1cf-6aac90dca01mr2240458a12.33.1790259210418; Thu, 24 Sep 2026
 07:13:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260924100106.2054127-1-zong.li@sifive.com> <arUSRcgzWurL-YrL@8bytes.org>
In-Reply-To: <arUSRcgzWurL-YrL@8bytes.org>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 24 Sep 2026 22:13:18 +0800
X-Gm-Features: AclHuK-bIWWUadjBwDkFnhXkUVbzOHGI5rymQuXxYOn79n8X8KsdtkoE0POTC7w
Message-ID: <CANXhq0qL5qwejCXcfLNYfK025AYaMbMOzf=p0EP-NOkThL30Ug@mail.gmail.com>
Subject: Re: [PATCH v14 0/2] RISC-V IOMMU HPM support
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: tomasz.jeznach@linux.dev, will@kernel.org, robin.murphy@arm.com, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	mark.rutland@arm.com, andrew.jones@oss.qualcomm.com, guoren@kernel.org, 
	david.laight.linux@gmail.com, zhangzhanpeng.jasper@bytedance.com, 
	yang.yicong@picoheart.com, nutty.liu@hotmail.com, iommu@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_071333_133895_ED9F0ABA 
X-CRM114-Status: UNSURE (   9.47  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBTZXAgMjQsIDIwMjYgYXQgODowN+KAr1BNIErDtnJnIFLDtmRlbCA8am9yb0A4Ynl0
ZXMub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgU2VwIDI0LCAyMDI2IGF0IDAzOjAxOjAzQU0gLTA3
MDAsIFpvbmcgTGkgd3JvdGU6Cj4gPiBUaGlzIHNlcmllcyBpbXBsZW1lbnRzIHN1cHBvcnQgZm9y
IHRoZSBSSVNDLVYgSU9NTVUgaGFyZHdhcmUgcGVyZm9ybWFuY2UKPiA+IG1vbml0b3IuCj4KPiBE
byB5b3UgaGF2ZSBhIGxpbmsgdG8gdGhlIHNwZWNpZmljYXRpb24gb2YgdGhlIEhQTSAoYW5kIGFk
ZGl0aW9uYWxseSB0aGUgSU9NTVUKPiBpdHNlbGYpPwo+CgpIZXJlIGlzIHRoZSBkb3dubG9hZCBs
aW5rIGZvciB0aGUgbGF0ZXN0IHJlbGVhc2Ugc3BlY2lmaWNhdGlvbjoKaHR0cHM6Ly9naXRodWIu
Y29tL3Jpc2N2LW5vbi1pc2EvcmlzY3YtaW9tbXUvcmVsZWFzZXMvZG93bmxvYWQvMjAyNjAyMjIv
cmlzY3YtaW9tbXUucGRmCkFsdGVybmF0aXZlbHksIHlvdSBjYW4gcmVmZXJlbmNlIHRoZSBHaXRI
dWIgcmVwb3NpdG9yeToKaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LW5vbi1pc2EvcmlzY3YtaW9t
bXUKVGhpcyBzcGVjaWZpY2F0aW9uIGluY2x1ZGVzIGJvdGggdGhlIElPTU1VIGFuZCBIUE0gcGFy
dHMgKHNlY3Rpb25zIDYuMTkgLSA2LjIzKS4KVGhhbmtzCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
