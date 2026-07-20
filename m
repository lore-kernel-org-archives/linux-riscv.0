Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026EDC4452A
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 14:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PFmm4zKKl7JfEiEBu5gS9QNhwTGiO6ELGaE5zMSgsFA=; b=T6JAOH3lVH4zF7
	fENnChxSUkwt0BJ+5k7mNIZ5oxVjydeBaa88xhUkZVoLcxn7LxMhDT/+Ez8uIr778/CJVYvqxr74h
	A6TUWn6uEam9PwB6QMoBHYyLNI7+9PnC+ZRboKvU6U5gpnMP8JWr0zN5nHl+YlQJ3GIygRmRo+/sd
	VcHlcpfkvOGLcEggNq6VqjHJpGoZF+dmlNzUcGRj9qBzVDe1Lq/44DAB1ohrgZCosH+UjRUlT3BU8
	DwMaG5SPGaHfmxXLS4c6CrSpSM5CZRd8hRoe9fcMaow+WZusb2KcBXEkNBJ9hqUjbdMvH11PpAoe7
	dEyVBFoXTHBfyjRoC1eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpNq-000000072kj-2HVQ;
	Mon, 20 Jul 2026 14:54:18 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpNo-000000072j2-0Jy5
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 14:54:17 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-664b05d408bso5713352d50.1
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2026 07:54:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784559255; cv=none;
        d=google.com; s=arc-20260327;
        b=UuT6/gN+T9NR/yErtSpWHstN0GTAKOfbfIn+2ZpFDfHayhAepGZFgglyCCFW8h9qGs
         wOyxFBKmenIPOW3Wq15FXEaFZhvhXdbxe2ybbEe1u4mSlsLp+6YRIJaysbj+7sVla7qv
         PJSwI2M+qKNFQ23ouKVUP7UqiOrwfesPgTO2xaqqfZJBfgPsrZCQfVtvzCquHaWDPXCX
         BeqIvdOYfDPVaJeQT9AT2LOTqv1a8oZcjLC9pOq6lMzzAFt6lE67txWd/cCXiigiRi2C
         rrZvmuFUIQtvzSLfOCUPbjgvfVTUjg8IeJWmI15BjmOkP0G4rBDBN4QUvfPPP50UlTiJ
         C8tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I0GVcV6hLmc+NX2bk98Kn3FEQV44lshItim/tETy764=;
        fh=cCH1sqL2EloHRPlzBjOFIDDSTaG/P5BU2DW0JRR2zFk=;
        b=UIy70/hsVNR+Tjl0rD1sNdNdu0L0SnEW72PpcM2gktt35qURFoFrH09j01sDj6xJ5+
         /DQRa0Qv/wa9InrJwen+wAy4zrz9UBuX4M+RVFEqjRaD4WIRiE8zPqnHS9TZF7a2ksmT
         gbUAoOFhdr/MIVMLpTytdZuYXyt80Lpt3kvJJJIyXbK9axRtdtLYRLFIDr1lzGnSOjMh
         qyZlSKtQgY5QrXx9uTj7omZ0GzRskRZCoT+pOjfDgnAYxgkSYT153r4wClg3on24QSWW
         rqxf9UxCqO1LfwRIItL4BbEwlh5WJyMb6pVY5nADlVJ0YLGn+02wDG47FoOqbzNxbQwA
         BV2A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784559255; x=1785164055; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I0GVcV6hLmc+NX2bk98Kn3FEQV44lshItim/tETy764=;
        b=EMnn/5j4mB54wJyUGKXzTsTRc2g9uoRZl9beNoyt05k9CIcKqxK9s7VS8E01a0b4qX
         p3uBk38AQ3vO/TrhHVAJ4mYo63bVRp9YFV2SoKCa4jAeCeC5HdKUAjm/PAt/3/7+y6Pr
         3u33VS37D49NOesy5y4ssRAS/MEtVmdMbofihBZ0xSrISCduLRLrc8vHbvfnmhF4bk1Z
         sj3tXB48w930IvUt1gvFnaTdkRiSQHpdCkqtbByNmLcI4lFjUJhkjmAfo2RyXB6ezloZ
         CPm8NwO7a7uuWKWR1MYeNOizQmnRPM/zmbU6ViFlItlcPMsrnbsCDgl2RhjQK6tFeiJE
         6ihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784559255; x=1785164055;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I0GVcV6hLmc+NX2bk98Kn3FEQV44lshItim/tETy764=;
        b=gtt4RvDmvqjpqcCYQHgzx3Gxw1nWxmjov226g14aceVI4V0GgJloSx5QIh8/nyyeyp
         /DTjQF6xclbF2Xjse+carTHOlLzRg2sKhs795l0mzXEWsk4CQdp0P2AdPGjzStH2Pbkw
         48saIexMIxTkxqGsc7XI6dTP9WAanyTFyY4raEax3qukT5TWWh1zhAfn2OuX6X4ed+az
         lFE3s6DZ4/mbSzeF3S7woPl6CK+ftsgk6hKuR+yPFVhudY/6VCk2JBY2uV/UUJfZ1PCY
         j2o6+AoqRKGawg4BBDxcY6hyivSlS8lb8LNVSsjurOjf05wdIeSOncD1bYQnj8VB3GRi
         qieg==
X-Forwarded-Encrypted: i=1; AHgh+RqL7o8vxObF95i8tcf9xhKM/eB3Dzclj3CvVFZVeBEAJoMtFOJrPiMt93VHGyBklZBgOTdEo73MiIP6uA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwGblKiV3LnfBajs0DVE/yBlOQFVPtH7crKEAiQ5ifwpq6sRBv/
	t8rULzJ41ayK9fghKOllFhB2zycjgk96MMDV/qDkw7mDllJZCXAtarI1X7nYRYzZ7hK6nhnZozc
	opCzRmdmVoo1aJh2id/t9Cr49dMVOF4sV0hxsfJzP7r6wuWy9MsbD2xc=
X-Gm-Gg: AR+sD10HEShszoFElB9BYiw0UZJGBANZjTGTKW7iW4pDbJI28UVp2OpP8O6iGPtKimU
	+CuIHS6VkVeQy5WBH/ROIx/4qqpVX5JHiwf15HqmMdjaeku8W74usslRP+3LhIWQijlb9HeO92N
	WmMk5rd9uk1V05/zhAyY96Krk7RuP+mmbjAni8V1L4l4q6reh7H+hguyV4ORvIyWf5d1ajPJTfi
	dtsEwzlIDVbKpwxOo/ieYFIX0AxiPcgKE3xVMGhMWi8aHP18S0hYwyQSzj3Z4z22MlhkfqHb5wM
	mSXGpiOCOSc4cesu
X-Received: by 2002:a05:690e:4105:b0:668:7014:4ca with SMTP id
 956f58d0204a3-66870140b44mr796774d50.58.1784559254891; Mon, 20 Jul 2026
 07:54:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260429-fix-riscv-swiotlb-v2-1-fa99dfdfc94d@linux.dev>
 <k55h7j5qnn3dryqro2oof7kgjcdhyoarvg7uvtm6sbrgdtnfzy@br6areeqp4ng> <57a24fb1-1ca6-3bb5-1c1e-bdcb50ce2b7e@kernel.org>
In-Reply-To: <57a24fb1-1ca6-3bb5-1c1e-bdcb50ce2b7e@kernel.org>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Mon, 20 Jul 2026 09:54:03 -0500
X-Gm-Features: AUfX_myMpZ4WtjKhLTFNevvbFR59U6AEJ6ipYVurDAp_Rw5Z-rFxfTZK12VSyqc
Message-ID: <CAEev2e_odw-Rcz1dKQq7oNDN6sex0cnVgdYtR=NZkKoo57p7Mg@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: mm: fix SWIOTLB initialization for systems with
 DRAM above 4GB
To: Paul Walmsley <pjw@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_075416_127537_B7F2F5AC 
X-CRM114-Status: GOOD (  20.02  )
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

SGkgUGF1bCwKCk9uIFN1biwgSnVsIDE5LCAyMDI2IGF0IDc6NTXigK9QTSBQYXVsIFdhbG1zbGV5
IDxwandAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBIaSBUcm95LCBBbmlydWRoLAo+Cj4gYSBmZXcg
cXVlc3Rpb25zIC0KPgo+IE9uIFR1ZSwgMTQgSnVsIDIwMjYsIEFuaXJ1ZGggU3Jpbml2YXNhbiB3
cm90ZToKPgo+ID4gT24gV2VkLCBBcHIgMjksIDIwMjYgYXQgMDc6NDE6NTRQTSArMDgwMCwgVHJv
eSBNaXRjaGVsbCB3cm90ZToKPiA+ID4gT24gUklTQy1WIHBsYXRmb3JtcyB3aGVyZSB0aGUgZW50
aXJlIHBoeXNpY2FsIG1lbW9yeSAoRFJBTSkgcmVzaWRlcwo+ID4gPiBhYm92ZSB0aGUgMzItYml0
IGFkZHJlc3Mgc3BhY2UgKGkuZS4sIGFib3ZlIGRtYTMyX3BoeXNfbGltaXQpLCB0aGUKPiA+ID4g
Y3VycmVudCBTV0lPVExCIGluaXRpYWxpemF0aW9uIGxvZ2ljIGZhaWxzLgo+Cj4gSXMgdGhpcyBw
cmltYXJpbHkgZm9yIHRoZSBTcGFjZW1pVCBLMz8gIE9yIGFyZSB0aGVyZSBvdGhlcgo+IHBsYXRm
b3JtcyB0aGF0IHRoaXMgZml4ZXM/CgpCbGFja2hvbGUgaGFzIHRoaXMgc2ltaWxhciBpc3N1ZSB3
aXRoIG5vIERNQTMyIHJhbmdlcy4gVGhpcyBmaXgKYXBwbGllcyB0byB0aGF0IHRvby4KCj4KPiA+
ID4gVGhpcyBwYXRjaCBhZGRyZXNzZXMgdHdvIGludGVyY29ubmVjdGVkIGlzc3VlcyBvbiBzdWNo
IHBsYXRmb3JtczoKPiA+ID4KPiA+ID4gMS4gSW5jb3JyZWN0IDMyLWJpdCBETUEgYm91bmNlIGFz
c3VtcHRpb246Cj4gPiA+IFRoZSBleGlzdGluZyBjb25kaXRpb24gYG1heF9wZm4gPiBQRk5fRE9X
TihkbWEzMl9waHlzX2xpbWl0KWAgYXNzdW1lcwo+ID4gPiB0aGF0IGEgMzItYml0IERNQSBib3Vu
Y2UgYnVmZmVyIGlzIHJlcXVpcmVkIHNpbXBseSBiZWNhdXNlIHRoZSBtYXhpbXVtCj4gPiA+IFBG
TiBleGNlZWRzIHRoZSAzMi1iaXQgbGltaXQuIEhvd2V2ZXIsIGlmIGFsbCBEUkFNIHN0YXJ0cyBh
Ym92ZSA0R0IsCj4gPiA+IG5vIG1lbW9yeSBleGlzdHMgYmVsb3cgdGhlIGxpbWl0IHRvIHNhdGlz
ZnkgdGhpcyBhbGxvY2F0aW9uLiBGaXgKPiA+ID4gdGhpcyBieSBhZGRpbmcgYSBjaGVjayB0byBl
bnN1cmUgYG1lbWJsb2NrX3N0YXJ0X29mX0RSQU0oKWAgaXMgYWN0dWFsbHkKPiA+ID4gYmVsb3cg
dGhlIDMyLWJpdCBsaW1pdCBiZWZvcmUgZW5mb3JjaW5nIDMyLWJpdCBTV0lPVExCLgo+ID4gPgo+
ID4gPiAyLiBrbWFsbG9jKCkgYm91bmNlIGJ1ZmZlciBhbGxvY2F0aW9uIGZhaWx1cmUgb24gbm9u
LWNvaGVyZW50IHN5c3RlbXM6Cj4gPiA+IEZvciBub24tY29oZXJlbnQgaGFyZHdhcmUsIGEgYm91
bmNlIGJ1ZmZlciBpcyBzdGlsbCBtYW5kYXRvcnkgZm9yCj4gPiA+IGNhY2hlLWxpbmUtYWxpZ25l
ZCBrbWFsbG9jKCksIGV2ZW4gaWYgMzItYml0IERNQSBib3VuY2luZyBpcyBza2lwcGVkLgo+Cj4g
SSdtIG5vdCBzdXJlIEknbSBwYXJzaW5nIHRoaXMgY29ycmVjdGx5LiAgU2hvdWxkbid0IHRoaXMg
cmVhZCAiZm9yCj4gKm5vbiotY2FjaGUtYWxpZ25lZCBrbWFsbG9jKCkiID8gIE9yIGFtIEkgbWlz
c2luZyB0aGUgcG9pbnQ/Cj4KPgo+IC0gUGF1bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
