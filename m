Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD293C6FA8F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 20:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ov8nzEuCqps5DLwQxI88+QT07Kns0REAVogEDjAr/yw=; b=Q+PoiUnN82CcwH
	Mo5Ew3dq/OqbpMoccOx5SUwN8/LvC4xdBZdGBUMzku0pp22EyUq8YsW4E0SqDjQkowvEQH+hUULO4
	BT20OVrEsuvQok4XzSGLxXhtHi5bxJKBCwBHRjSdP55uxbRaLBwWwI5awTKAUZ8MxMvjSN+LHGLLi
	MpFRJC6Q+uOGhhTpXIKHuem7fn/TjQzEuJDQZ6J4vRbVRS7fe6U+kvp3Qp9Quk1lL6RVcn/2On3Ct
	fe2LQhFlQhGC01G2RL6hbi9bso0zyjgwbhHpFWC+Ahlxf1ANq5o2T9MeGSOHUaDpO7BleG4gZ4PDh
	/OS/CCsYEssLM17rtncQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZHMM-003mMf-36;
	Thu, 24 Aug 2023 20:55:18 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZHMJ-003mLK-3C
	for linux-riscv@lists.infradead.org;
	Thu, 24 Aug 2023 20:55:17 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-4108a8f0de7so1268601cf.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Aug 2023 13:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692910514; x=1693515314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9veUMJ/z882K9hkHEmh4pAoTDmJO4VmWvc8gTfMi6Q=;
        b=cNir2zO4Jw1bY15AO+BvLzyudCZQgZOZ6wmKu3gTiOE6O5d8uld/TL1ezLjaI6QYbm
         WOGGPHYDU/pK4dxlnF7Ms+FTC/sMRd3w0UHs5vWl7Ok8xxNThnUi40LTsEqvRgt612yt
         78aWAjEVTurY9yP/vzKIVztJ70N6XuOBe4TzTTYoIN4ZaN51LMOSChOtgvQbcVaqgblP
         cXZz8KRbjOvTDGzMC8MqwpETfoHXd3UWkIm9s5iVgENo6DP/sbX4cOh9u7J1okj8PlZZ
         BokMSSDN911JlFclyP8hVqyb+sA6fCfvwhQTmJ3jDmPDMIreFp+riuf57qJzWHHRcB6x
         9FPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692910514; x=1693515314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9veUMJ/z882K9hkHEmh4pAoTDmJO4VmWvc8gTfMi6Q=;
        b=hEJuiZhYn0w5nGbJZs6vXJD8PMQsfZmmVOboQRNRGuAvwPYEWz3FHe6eu86W61kbD8
         28blOJiJOSHZ1NjrhV3Eb9ZABYtbAxWxlyhVlWb5P3xqLLrWMyqcPoUKefCsQbrgBERa
         yd3x6klbgkY2Dn16FEPsfdGt6lGo8xORf1dzwY4FXj1PeT4oOB3s599J9qd35QeTASLo
         RDkx1sicjKmQhNSd9RkeRHnipORxsPGDUZK9Co5R21E/BZMNjAEg4xcEcp/GoH5hB3Yd
         TIaAWb0o00sVL5BtrOJmmL4mz2LF3wNbPT6Ue9pYqPz2Gn7ZXrUpeSkHCMQMnBP/ktLF
         zFmw==
X-Gm-Message-State: AOJu0YzY8nYD3Yq/d/GAzx/CGY7NfhprDHTaDL2whKYJezThGD7kfxUl
	T2mJDztJSx+ETDKd+BMfFfDI+RziqCobZGunz4ng1A==
X-Google-Smtp-Source: AGHT+IGp1K8B09Bdl+oZ3RkqbVetgjSDMnQuEIy2o3NTYbqmOnwJtltpQ9JU5CwHn6kcCYZRMLaYXjyuarXlr9l4qDA=
X-Received: by 2002:a0c:e2ca:0:b0:64f:3b07:c50a with SMTP id
 t10-20020a0ce2ca000000b0064f3b07c50amr13629295qvl.58.1692910513818; Thu, 24
 Aug 2023 13:55:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230824-docs-v1-1-67e061278b8f@google.com> <20230824184910.GA2015748@dev-arch.thelio-3990X>
In-Reply-To: <20230824184910.GA2015748@dev-arch.thelio-3990X>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 24 Aug 2023 13:55:03 -0700
Message-ID: <CAKwvOdkas2gmcyVKSp0DSXC56jxUB1HW8XRYKVBfS0sz3MSi5w@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: refresh docs
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Tom Rix <trix@redhat.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_135516_035420_867A3D76 
X-CRM114-Status: GOOD (  10.57  )
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

T24gVGh1LCBBdWcgMjQsIDIwMjMgYXQgMTE6NDnigK9BTSBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0
aGFuQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBBdWcgMjQsIDIwMjMgYXQgMTE6MDM6
MTdBTSAtMDcwMCwgbmRlc2F1bG5pZXJzQGdvb2dsZS5jb20gd3JvdGU6Cj4gPiAtV2UgcHJvdmlk
ZSBwcmVidWlsdCBzdGFibGUgdmVyc2lvbnMgb2YgTExWTSBvbiBga2VybmVsLm9yZyA8aHR0cHM6
Ly9rZXJuZWwub3JnL3B1Yi90b29scy9sbHZtLz5gXy4KPiA+IC1CZWxvdyBhcmUgbGlua3MgdGhh
dCBtYXkgYmUgdXNlZnVsIGZvciBidWlsZGluZyBMTFZNIGZyb20gc291cmNlIG9yIHByb2N1cmlu
Zwo+ID4gLWl0IHRocm91Z2ggYSBkaXN0cmlidXRpb24ncyBwYWNrYWdlIG1hbmFnZXIuCj4gPiAr
V2UgcHJvdmlkZSBwcmVidWlsdCBzdGFibGUgdmVyc2lvbnMgb2YgTExWTSBvbiBga2VybmVsLm9y
Zwo+ID4gKzxodHRwczovL2tlcm5lbC5vcmcvcHViL3Rvb2xzL2xsdm0vPmBfLiBUaGVzZSBoYXZl
IGJlZW4gb3B0aW1pemVkIHdpdGggcHJvZmlsZQo+ID4gK2RhdGEgZm9yIGJ1aWxkaW5nIExpbnV4
IGtlcm5lbHMuIEJlbG93IGFyZSBsaW5rcyB0aGF0IG1heSBiZSB1c2VmdWwgZm9yCj4KPiBNYXli
ZSBtYWtlIGEgbm90ZSBvZiB3aHkgdGhpcyBtYXR0ZXJzPyAiLCB3aGljaCBzaG91bGQgbG93ZXIg
a2VybmVsCj4gYnVpbGQgdGltZXMgY29tcGFyZWQgdG8gbm9uLW9wdGltaXplZCBMTFZNIHRvb2xj
aGFpbnMuIj8KCk9oLCBJIGZvcmdvdCB0byBhZGRyZXNzIHRoaXMgaW4gdjIuIFdpbGwgc2VuZCBh
IHYzLgoKLS0gClRoYW5rcywKfk5pY2sgRGVzYXVsbmllcnMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
