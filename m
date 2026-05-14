Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A31ACD4F39
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 13:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K7CL1P9Tws7vwmWs0A0qXGpxO2v+mDps6S9jPIgWRNY=; b=LIxVuqEi4HlVFF
	723fqNKBknwxw+okCihGe7Hxb3wVyG5/pw595jmXhyqu1TbBrsGOF3gDLq3iGVNdg8+0KW1YWAz5w
	ffYcs0FZSwOV/V6LE/IuoxBCL3er8YCTSmI9b7C187PKjygsgLr84s1F6P9lKCXEkYW7688VXlTs3
	CRbNROOf2QVXyX1LeCUZ7niJ8hKkVZ8TQf3EpQlts0l3vJaFNgPhaPHVEaKrVlaZ0UYCTD3X2ZJLd
	E7UAUDgPPY+pJfiebOy/6ma6Qwsz5bVC0sZMOwRRtggLEbxCL0p6nE8wCnyqhEJkHraR626AZWid8
	46jSYwZQJS7eC2I5RNmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVvE-00000005ZR7-0q3X;
	Thu, 14 May 2026 13:16:17 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVvB-00000005ZQ7-038D
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 13:16:14 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7d55b97f358so5461304a34.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 May 2026 06:16:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778764571; cv=none;
        d=google.com; s=arc-20240605;
        b=AT3uBVsQvO03wgvcdcGVvnOKDW90J5HZausV50UcscHNrKeoTwMyBtsWXqicm/kduz
         ojK43tiHwdFWo6/JgFc4OAX+TD7UaJyT9HcjLoAzS/Psac4LmHPmVtxwfxl434+LHq0k
         DkEvzddT1HFvsJ05GUHb3xKUUUwu116tKR3WZlTeasqQ9I2RbzuJiaJ6RNrNbLXA8Q51
         lliJ8yW6/Nm5mnVBT+db3yBPTYkeHG6CiYGHWml5qaI6I0TnWTvCIFqwWkRTHuBVEcMO
         o+IDo7vZIgQUUMTB4F72a85xD4DxINfOKaaMHlWdJ98Fscjk/L3X6RkrhELU1UopoCLJ
         sKeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2L0wvqc81PCyDXrG7skbGOKy477Mis33owEkB25SlXA=;
        fh=98rwioDsr2eygsfrE9IGovbqJDrwxEJ8GB7SffcZE3Y=;
        b=BnVIBkG7pMZXYZrkIzi+Kl4CkZOLBLp1mGdxrcEY8fp2mRp+ckQorDIbB7XnEljOIp
         G4RpyydOqxw8S4yZom3BgGEyCfcs6ucUfEa0rG6k4izfwgq23JlTyhVykp51G5YH2J6F
         4TNCOJz83HvTBq2IqlWd2tcTWTZfvlyQ7FmAxb/p/f3U6UuJkW9mK+aGu1rs20eY8tU9
         wOgesrR0nu1CQoJq1/vMvFo8LgRrlv2yrxAwuNfmgavmYfmYhh7sqjCc4qs4sIPGYPvc
         8LYppuUQZG9ylMmsAotrueipnB5ye0elQb7BGuiEvJ3+xzMWhpfFfjguSrSj5TZgd9WR
         QNpQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778764571; x=1779369371; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2L0wvqc81PCyDXrG7skbGOKy477Mis33owEkB25SlXA=;
        b=gs7NVkM5stjI65OqgUlh/E8gfRG1H15wk8VOaSKpPvphBYZXE2RFLjHIhhHXwFKoS6
         2/NeYfvlSpdG2dDbUqoOulBj7YM3mpYyOp+iL2avB+Fqfw3aHBDgnt9+YB4roUtyM60V
         XktBlEBvs7mPzI3Fn/sI8AtUl+SVqFII/g0EbtI6oqLARkIcAkJt2wEf4RHl78mhesmP
         v0uQRTxDyLEUIEdIGR7OQlQbALPs+13411VuwkEhOJQZ88bLMzycwoQoyJd/ubCfFQuJ
         wYjcykFNxoaWmNKAR4cCOBu2AGDQxhCb94KYk1gRVTQdm1LoJlDcmdz40kctvdErsV3G
         zQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778764571; x=1779369371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2L0wvqc81PCyDXrG7skbGOKy477Mis33owEkB25SlXA=;
        b=j/aiaX+44IFC0wOH0AaiUIqgdqtpv2Sxo8472vn8VcDVyIWnh35yhIQS1/guVpme3o
         YaQNuDfx3ff1kJBt4ZBncvCUPtvJ+bJFuvEGaGeHYvP1+VNwPLgIXpgV9famW99Of+tw
         9g3ufrofDzqwBNnmza0HIlyWhirC+AUsP9kX8JlFthRrl75eLTrG3PCVkBLhGkTKYEnX
         cYnrCswq37Bfwf0iZbd8RbxIy0LbT+6m6NGwDesChLB2+yVOTy0inXqPJL8u7gtS4dXS
         PFVkZZV4yjkRmqh44kmjcTj9HgPwQ3fzZ3m7N6k7Gc25rZ7CgOw5Bg4pORiLiemBI9tK
         JIZw==
X-Forwarded-Encrypted: i=1; AFNElJ/bSwAVB+B2SLwxGZU+5kY2fWxi9mjvcn1HiUYiLuyn6ww8b110HlHCqML6zbJdB9TENV+uZMS3XvqlEA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4J5o5guDK1ejoWswvNNGdACCK1FB9/CHSFLr8K2iQfFk1f+IN
	Ej1iaBBJZd3I0V30iYzHWpANFh8wr4d0N2D/P6iKeFQ4i5K+bddYnwcyzGUNXirkh6NS6GJfwsC
	iiu5OSp4sLyvHslU4xN53vQthHwlkU9EHmJjDYGoPtA==
X-Gm-Gg: Acq92OGfhptXYQ25gYTHGp9OVn0dC9Sn2NoBSTnP5SI+fKYIz/A0QtAb9wpYP6uHw7I
	fxPXqZefqUBU2B6K3yrtQtZPrK3Zj1a85g3kYNAM2/AJrhz4XoI3qao5LnDJJMv4oZD7xCwuUl0
	Hscm22ISb5qJW+OcUAjwiFwDy708dv778DaVcZBy1d0wA0A+ZXCIeq/OaP0+BoEpDVj28MH1muG
	XEV061WxNiAa3jrGGJLwPb4RbvIfoy2grhupYbmT9Puzj+sLEKXBKgvqep/lQLipBwGnVXRMhy4
	M2ICIxNfiLOOhKpfybBbALmr9WVghzrSTL6g4QqqGnwKzoExXI4hRra9r+7h2Qbhon+n5/yyglz
	Dj5OTBE6c+4mhL3j/YB78vOZiatM=
X-Received: by 2002:a05:6830:6209:b0:7e1:e832:c8a2 with SMTP id
 46e09a7af769-7e3dc905429mr4793888a34.19.1778764571356; Thu, 14 May 2026
 06:16:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260415075216.2757427-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260415075216.2757427-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 14 May 2026 18:45:58 +0530
X-Gm-Features: AVHnY4JeoNYVJt-e7SmR0Mdkf1NGWqjoq_KVrwu0L02Ywar886al5DcZ-0R7w5o
Message-ID: <CAAhSdy0CSbsmdjCu36F-8-CD4A2Sfz4Q4OYa3i=9o1MJeVT8=w@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix invalid HVA warning in steal-time recording
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Jiakai Xu <jiakaiPeanut@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_061613_049174_E4EDECFB 
X-CRM114-Status: GOOD (  23.50  )
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

T24gV2VkLCBBcHIgMTUsIDIwMjYgYXQgMToyMuKAr1BNIEppYWthaSBYdSA8eHVqaWFrYWkyMDI1
QGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IGt2bV9yaXNjdl92Y3B1X3JlY29yZF9zdGVhbF90aW1l
KCkgYXNzdW1lcyB0aGF0IHRoZSBzdGVhbC10aW1lIHNoYXJlZAo+IG1lbW9yeSBHUEEgKHZjcHUt
PmFyY2guc3RhLnNobWVtKSBpcyBhbHdheXMgYmFja2VkIGJ5IGEgdmFsaWQgZ3Vlc3QKPiBtZW1v
cnkgc2xvdC4gSG93ZXZlciwgdGhpcyBhc3N1bXB0aW9uIGlzIG5vdCBndWFyYW50ZWVkIGJ5IHRo
ZSBLVk0KPiB1c2Vyc3BhY2UgQUJJLgo+Cj4gQSBtYWxpY2lvdXMgb3IgYnVnZ3kgdXNlcnNwYWNl
IGNhbiBzZXQgdGhlIFNUQSBzaGFyZWQgbWVtb3J5IEdQQSB2aWEKPiBLVk1fU0VUX09ORV9SRUcg
d2l0aG91dCBlc3RhYmxpc2hpbmcgYSBjb3JyZXNwb25kaW5nIG1lbW9yeSByZWdpb24gdmlhCj4g
S1ZNX1NFVF9VU0VSX01FTU9SWV9SRUdJT04uIEluIHN1Y2ggY2FzZXMsIHRoZSBHUEEgY2Fubm90
IGJlIHRyYW5zbGF0ZWQKPiB0byBhIHZhbGlkIEhWQSBhbmQga3ZtX3ZjcHVfZ2ZuX3RvX2h2YSgp
IHJldHVybnMgYW4gZXJyb3IgYWRkcmVzcy4KPgo+IFRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9u
IGluY29ycmVjdGx5IHRyZWF0cyB0aGlzIGFzIGEga2VybmVsIHdhcm5pbmcKPiB1c2luZyBXQVJO
X09OKCksIHdoaWNoIG1heSBlc2NhbGF0ZSB0byBhIGtlcm5lbCBwYW5pYyB3aGVuIHBhbmljX29u
X3dhcm4KPiBpcyBlbmFibGVkLgo+Cj4gVGhpcyBpcyBub3QgYSBrZXJuZWwgYnVnIGNvbmRpdGlv
biBidXQgYSBub3JtYWwgaW52YWxpZCBjb25maWd1cmF0aW9uCj4gZnJvbSB1c2Vyc3BhY2UsIGFu
ZCBzaG91bGQgYmUgaGFuZGxlZCBncmFjZWZ1bGx5Lgo+Cj4gRml4IGl0IGJ5IHJlbW92aW5nIFdB
Uk5fT04oKSBhbmQgdHJlYXRpbmcgaW52YWxpZCBIVkEgYXMgYSBub3JtYWwKPiBmYWlsdXJlIGNh
c2UsIHJlc2V0dGluZyB0aGUgU1RBIHNoYXJlZCBtZW1vcnkgc3RhdGUuCj4KPiBGaXhlczogZTlm
MTJiNWZmZjhhZDAgKCJSSVNDLVY6IEtWTTogSW1wbGVtZW50IFNCSSBTVEEgZXh0ZW5zaW9uIikK
PiBTaWduZWQtb2ZmLWJ5OiBKaWFrYWkgWHUgPHh1amlha2FpMjAyNUBpc2Nhcy5hYy5jbj4KPiBT
aWduZWQtb2ZmLWJ5OiBKaWFrYWkgWHUgPGppYWthaVBlYW51dEBnbWFpbC5jb20+Cj4gQXNzaXN0
ZWQtYnk6IE9wZW5DbGF3OkRlZXBTZWVrLVYzLjIKClF1ZXVlZCB0aGlzIGFzIGZpeCBmb3IgTGlu
dXgtNy4xLXJjWAoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3Ni
aV9zdGEuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfc3RhLmMgYi9h
cmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9zdGEuYwo+IGluZGV4IDNiODM0NzA5YjQyOWYuLjYwZTUw
Mjk2YTAwODUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfc3RhLmMKPiAr
KysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9zdGEuYwo+IEBAIC00Niw3ICs0Niw3IEBAIHZv
aWQga3ZtX3Jpc2N2X3ZjcHVfcmVjb3JkX3N0ZWFsX3RpbWUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
KQo+ICAgICAgICAgZ2ZuID0gc2htZW0gPj4gUEFHRV9TSElGVDsKPiAgICAgICAgIGh2YSA9IGt2
bV92Y3B1X2dmbl90b19odmEodmNwdSwgZ2ZuKTsKPgo+IC0gICAgICAgaWYgKFdBUk5fT04oa3Zt
X2lzX2Vycm9yX2h2YShodmEpKSkgewo+ICsgICAgICAgaWYgKGt2bV9pc19lcnJvcl9odmEoaHZh
KSkgewo+ICAgICAgICAgICAgICAgICB2Y3B1LT5hcmNoLnN0YS5zaG1lbSA9IElOVkFMSURfR1BB
Owo+ICAgICAgICAgICAgICAgICByZXR1cm47Cj4gICAgICAgICB9Cj4gLS0KPiAyLjM0LjEKPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
