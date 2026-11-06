Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341CD606A328
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 09:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JmLM6KpW;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KEiZixi8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=G53Gkaa+NccLSriUCH61bs7kNAWSDrDAoluZR6FYCKY=; b=JmLM6KpW9w9J9yRyGYuPgzXNZu
	H5SNiVkwYPkbsHv1XSoyCfZWIuuzlEfdhy/ewWk75f5AvCaMSDGhDh2e3p28jWWD2S1p96hn57ucy
	ZMjB4ITSWbE+ykd+ZMoJ5QGBQkcn8FDOYqtusAhB/Gb1Ue+ngpzMILuDZz7mIftUxFodyXfCvorYW
	AlxwpoILzIuOVNNcD2H6IKyFNNe6sa4RqRbp2+pV+24kJ5SaW2aKZ+xttLZ86TdsaIns8sd4bx1JB
	n3vhVlSFoLDVTXve28UwHHQ4vkoh6DJljGd7xnrrbIMamVL817YCqb5pEs3SP23HdTx6IRhYnPbo4
	VO5tpXxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGaL-0000000BoKw-3Lrz;
	Fri, 06 Nov 2026 09:50:13 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGaH-0000000BoGp-3BMJ
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 09:50:13 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5bcb0f245e0so383231e87.3
        for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2026 01:50:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793958603; cv=none;
        d=google.com; s=arc-20260327;
        b=pALhf3ViDbSUccEVGLM+H4YctmZOw/h+4fkvKbZQipMnDRnoUFFkrW8zBHpSu++Qrn
         7vJHvqbXIHSY2rXMQpLAdS2wA33D/84igXa3SRF9tGqnbGrPPWF58VAUNFby1zSZ/80K
         a0eak8EvFXgxYDPPTOhYrwvUcpmyDxeEWewX8z8gQxp7qFeAdqm9qRYGbt6DpcjEhDC/
         /czug9pQXxIpFUcIxK0YIaUwOAADNsWBoT12VBV+rIQiAkHqfsk2v0jjhBWJpvLbTLh8
         x6vzFBu0aUrgAYWTcBAeKJ9967Q0gk/PG028to//ExHTaPB8rx4Lyg/XETVBJ/CeC04O
         sM9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i0RXhXRHqPQplgUbaoUrvnlIZ5UbVQs/4MlB5+exT+o=;
        fh=b5yu+fbMgNMOVwTrnNtfslzmHVkG3TdTGlHJNdYcvnk=;
        b=fhGGmTZt0BXMnh75wc2Ogzpwva0NkF4ncB7+AYuw6LZTGiMvDcrG6j7xbUd7WYy4yM
         WpgBMokm4AbfS/ftmbVaTGmpk5yghuCOaZZLPGqKvpRJ4/UAdC4MW08BaWq9fYBIxXYg
         2/CTeAaymnFspINZmL48FkKN3OwSm7RGMac5QHxu3USMlmO2gvI6ZkI7CGywPoRgXJtE
         JQ/HQ3kxG5FeMxYWEHKp4Waexi0PTJ9gWqY4xI4DKSCleunj0WN8S2g1lK3ZYNqwrzmy
         rJtbFKasBIl+oZZDlz0CjP7Caxz0CQJFhauaZH3P4uoUF6Y94czHmfrD3JbdX1n+2242
         av7Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793958603; x=1794563403; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i0RXhXRHqPQplgUbaoUrvnlIZ5UbVQs/4MlB5+exT+o=;
        b=KEiZixi86ODVCLkWakWZUtLHpmlIDlMjzgqn4YsZVpmRaXvis0thOjQIMF2Valyp6b
         MNt3UZuuZHhoc0kWRz14nxZBarZ0Ty0YxfaJVbYaZjpwE0XyRbbNjMBm6Td+DKD1Ay4G
         ELB0FZr0Ke3jhT2SfSvKRx/6euKul9ycQlXbam9G/kqB91/v8DgmvUEZS/SUTnD/mrsC
         aeFoUGAQ7IUhEADNHBbsja0C10C/Brh2uKwxK0i6iRt2/n0Yaveubyx9hfBwJDx+nIjE
         tbKsjbq8rsMEn6I9Lga+KDKFVKPmVtXat/yzL71IvanJSkJJy02pqVbcfH1bWWygLX+O
         JupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793958603; x=1794563403;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i0RXhXRHqPQplgUbaoUrvnlIZ5UbVQs/4MlB5+exT+o=;
        b=zcgUDfTXyCOWOzPrllQq9akH04c4vnMw1cPHaiqIxa7QXqR9onVKdLdqsyGQnit8WP
         T3fvze2U9ZbwWhL4GXHH4YdtbngTI1Vx1onmVeo+uC56PiKRdaU8tuq3WBhFKb4m9X2x
         /hXMXaToWRzE6QxzKy7KB7vcI3OMBnr8Y3lf2WaacEo9qejiJgaIjbkDnoMsBIKlEy/4
         uPU59PDlLwopkzVOE11dmmP4lMAbXAC/EwPYeCa2+fMkwVthnOOHkvEa+wXBl2GN59aY
         ++ujGyV7LwXHegwQPtj3IttLksjlaytlG2IWX/zrpc8Sk0s6mvRfYYssZQ5Y6NmIIU5w
         Gsuw==
X-Forwarded-Encrypted: i=1; AKwUvBx+o+OdztUhm7c1D3h/Y3V3fcSB7TQgdfKIXeQr2u7dUttLkm+7acKVtu0k9SsOr6aU1PzArsDx1ed0+A==@lists.infradead.org
X-Gm-Message-State: APuU4Z/lVaBi3LqxPQoUWHzHV+AA9IQs9EtIZyWElE4Jx72Xni7+QoHt
	fXxvFDlDWHHSV2HyLrjCfl3Ft21P7B7A2G3JIRqJBxQ25wAtFg/0tSJaYPjvteSP5n16VWWfLfC
	5/kysltyZ7LnhcQcwXrqsTVuEBoy2apw=
X-Gm-Gg: AYBFou1gxKlRUw5ui8FkdUV+dltMcvYw40PVThmw2uDTpLuHdsAPJIqIJlMty4ji022
	fInaikGYwFxEQ+B6zBUG8quobjPBt2PLb7EoZyakD3UD9wjqAidLLHMIoTfGxMDCfCpjgnsyHe3
	0PdGDFY9U5SWhlJBi4gMos8zwjhGfdHPmxV/W2nwru7zUGLG89bcZF/ipGcZDpK32+fXpbzykwP
	urbxSMF+kPTn1lG9hLePQxQfaThqRLeDYqnf7cunAdIcxrRK+s17anjtp7v6+A/U1CIB59ozmiX
	ODVrSXNlNpMphZPshmV1vKORp94Rri1/MLl3wduZqHGblOzNURrCzeBtXBiE4paOs9QgBt/nLkm
	EmtpLHtBWPX/TpTGaueGll1tLdYTADAvuUOLK6A1BJUYgssr7CKuoEofC9tmVXtahEFfr
X-Received: by 2002:a05:6512:3d93:b0:5be:3d95:3c7e with SMTP id
 2adb3069b0e04-5c003c084f6mr599060e87.65.1793958602580; Fri, 06 Nov 2026
 01:50:02 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261017030927.345454-1-suunj1331@gmail.com> <au01Qocxd1gsXs42@inochi.infowork>
In-Reply-To: <au01Qocxd1gsXs42@inochi.infowork>
From: SeungJu Cheon <suunj1331@gmail.com>
Date: Fri, 6 Nov 2026 18:49:51 +0900
X-Gm-Features: AclHuK_aMmYFw0Il5my2_hqoI2l0YbFq5ppI5iN9PgB32Mkgeg9mxiSxKYMIzIU
Message-ID: <CAGwK=3q7MuQQxMZSS=c=UxXX08xgwPqs7kpsPy1EiXgbZbknCQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: Only fast-path dirty-log write faults on
 host-writable leaves
To: Inochi Amaoto <inochiama@gmail.com>
Cc: anup@brainfault.org, atish.patra@linux.dev, tjytimi@163.com, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	andrew.jones@linux.dev, pbonzini@redhat.com, seanjc@google.com, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_015009_860161_C4949586 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBOb3YgNiwgMjAyNiBhdCAxMTowM+KAr0FNIElub2NoaSBBbWFvdG8gPGlub2NoaWFt
YUBnbWFpbC5jb20+IHdyb3RlOgo+IEkgZ3Vlc3MgdGhpcyBmaXggbWlzcyBhIHBhcnQ6Cj4KPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vbW11LmMgYi9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+
IGluZGV4IDUzYmIyNWE1YTYwYi4uMWIzNWFiOTgwYTEwIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlz
Y3Yva3ZtL21tdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiBAQCAtNzYxLDcgKzc2
MSw3IEBAIGludCBrdm1fcmlzY3ZfbW11X21hcChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVj
dCBrdm1fbWVtb3J5X3Nsb3QgKm1lbXNsb3QsCj4KPiAgb3V0X3VubG9jazoKPiAgICAgICAgIGt2
bV9yZWxlYXNlX2ZhdWx0aW5fcGFnZShrdm0sIHBhZ2UsCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdW51c2VkIHx8IChyZXQgJiYgcmV0ICE9IC1FRVhJU1QpLCB3cml0YWJsZSk7
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW51c2VkIHx8IChyZXQgJiYgcmV0
ICE9IC1FRVhJU1QpLCBob3N0X3dyaXRhYmxlKTsKPiAgICAgICAgIHdyaXRlX3VubG9jaygma3Zt
LT5tbXVfbG9jayk7Cj4gICAgICAgICByZXR1cm4gcmV0Owo+ICB9Cj4KPiBSZWdhcmRzLAo+IElu
b2NoaQoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LgoKU2FzaGlrbyBhbHNvIGNhdWdodCB0aGlzIHNo
b3J0bHkgYWZ0ZXIgdjEgd2FzIHBvc3RlZC4gSSdsbCBpbmNsdWRlIHRoZQpmaXggaW4gdjIgYW5k
IHNlbmQgaXQgc2hvcnRseS4KClRoYW5rcywKU2V1bmdKdQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
