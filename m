Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A424C3DA4B
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 05:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BF1A6ZWnB0ztn4ya0yd9Cwsg8vfR98hoXOF5d+kj7pA=; b=FI7gTXpLM63IFy
	roItpeKGD8LvsQshUK9Ouw62OCNJ1blELMlJ9oA/m2Y2JYm1FBpoPncZaaYI6UphbFwqJF+L8Xf1C
	e49aGnNBf8edaSFBa7iqF2JfC/k48cBe9zHV3+I0PP62Om3fsO5JJjbIxzJV/AWMAGE7DWCuwvZBE
	UQgNcj+I3Q0OP3OqrcM/iAJ5TCogUXmo4O2HqWL9S+Nt3WT+ZlZjDmfLKdVtWoabO/Fha3dDKtr7Y
	Nuymlb2e9akRcokMd30BPn3dldIkWgPs9j3ZHTX2wZ7SujGDtVqMBk9JyDPcblxj86op2/tBVh9eW
	j2W1oWL7SGE0upwgSoYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTxNC-0000000Cj7n-2Onj;
	Wed, 17 Jul 2024 05:38:42 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTxNA-0000000Cj6y-07fh
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 05:38:41 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3839d74a2abso2355765ab.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jul 2024 22:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1721194719; x=1721799519; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1d1s8x6mwhXq96evpThZCuzx5ViT58+IxOGUpFwTDk=;
        b=3S6Na43BMMNnAMc1gHhhwnh7SqTgo2dtWcqa6QLjzaCCUdWZKRFbPEjzYMcXgHNEVh
         Mkn/weXONtELaOnvo1stzX9cyvsoFbi0hLd6pT6pBlPww7fkRe3Wq/lOX3dBehX2fCgf
         A52Bi+QuZFB+yns8vrXFFQuU1t7XuSj8tYCzFUk8J6/iBWJcJt+7jQIz30sHay924kgU
         nhvrfOHy2cQBddzTrMuz9HoWFmIFhc6fpsrg09q0FTRxblRdImuPNulHeTiOdtvfyz7l
         2ILuEAzeMnVn6haTTHrMMCqEF4TNgP+iOydzZyfy+Kz4cGTdsFP2kKWfOcq1yoLdd2Cb
         OZ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721194719; x=1721799519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1d1s8x6mwhXq96evpThZCuzx5ViT58+IxOGUpFwTDk=;
        b=cnunW2vipKFh3V7doarZqhOWHoU67CVoPib5FqHtEZFgkCNwJAG8eYuFy/LGfIiqi5
         29/DDXNO12reBXYixQ+p5F+i3CNeWY9dftHrsgEHXay1L7p9VKhmN398tB4Oog/M83rM
         vDlJHf8MDk4n4Ww5URnkDzSe2Mos8U/phgr/0EyO027XoiyQt7NWW2c7oVjNNxYKk/r2
         RsuYsb9AzPHeKneddH8YG46KLVjNKprqqh+Y3MHSGq/tGcK+Z4qGc0E060W19ooIZdKA
         IMs1VRJ+PSFw80iJgyxy8g08gom6Vo0nYZfva57LuU8QTFrulgwg4TwHPam/8jftlUtF
         Fapw==
X-Forwarded-Encrypted: i=1; AJvYcCU1HpK2fe2QjQ9maCj1qEok9atT0AzcxltYTwiHHpWixFRLeWXVNij7Q07ZMQiIfH3meckX2BUU63Jcb64/2hyWW+l6ml1qR6GnvcPhTFaD
X-Gm-Message-State: AOJu0Yw0QPR58M/ZDD37W4FBL4NLYMWwpfegZIHxO2CEl2L5p2iHfIzQ
	chMkS5L1BAJJAkomyq6B+hMSapTfZKPjrGuw6zR+FZ0WRBHZPyVzF4thPvj6p7pavMdn/7s467t
	UkVffqG/5vOn2u3fvhhGHzMGrbw8Z4dWtPHDsOw==
X-Google-Smtp-Source: AGHT+IFar2Tx72l8Cv59EhI8FVwMpDSti1Ksk+Y6IAcwQVvN0Ug2DKjNu+xQ6dXlAHjN7eOD53sNRQW8pQa/oQb1+Ls=
X-Received: by 2002:a05:6e02:1384:b0:377:1611:1b49 with SMTP id
 e9e14a558f8ab-3955760f797mr9351435ab.25.1721194718728; Tue, 16 Jul 2024
 22:38:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240717031714.1946036-1-nick.hu@sifive.com>
In-Reply-To: <20240717031714.1946036-1-nick.hu@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 17 Jul 2024 11:08:26 +0530
Message-ID: <CAAhSdy2W3gCdx_EtqVaTLqk8nVOnc59T2ub3KhdCuS20qHWBSg@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: Enable the IPI before workqueue_online_cpu()
To: Nick Hu <nick.hu@sifive.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	tglx@linutronix.de, peterz@infradead.org, samuel.holland@sifive.com, 
	tj@kernel.org, alexghiti@rivosinc.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, greentime.hu@sifive.com, zong.li@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_223840_221422_E8C40291 
X-CRM114-Status: GOOD (  17.45  )
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

T24gV2VkLCBKdWwgMTcsIDIwMjQgYXQgODo0N+KAr0FNIE5pY2sgSHUgPG5pY2suaHVAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBTb21ldGltZXMgdGhlIGhvdHBsdWcgY3B1IHN0YWxscyBhdCB0aGUg
YXJjaF9jcHVfaWRsZSgpIGZvciBhIHdoaWxlIGFmdGVyCj4gd29ya3F1ZXVlX29ubGluZV9jcHUo
KS4gV2hlbiBjcHUgc3RhbGxzIGF0IHRoZSBpZGxlIGxvb3AsIHRoZSByZXNjaGVkdWxlCj4gSVBJ
IGlzIHBlbmRpbmcuIEhvd2V2ZXIgdGhlIGVuYWJsZSBiaXQgaXMgbm90IGVuYWJsZWQgeWV0IHNv
IHRoZSBjcHUgc3RhbGxzCj4gYXQgV0ZJIHVudGlsIHdhdGNoZG9nIHRpbWVvdXQuIFRoZXJlZm9y
ZSBlbmFibGUgdGhlIElQSSBiZWZvcmUgdGhlCj4gd29ya3F1ZXVlX29ubGluZV9jcHUoKSB0byBm
aXggdGhlIGlzc3VlLgo+Cj4gRml4ZXM6IDYzYzU0ODRlNzQ5NSAoIndvcmtxdWV1ZTogQWRkIG11
bHRpcGxlIGFmZmluaXR5IHNjb3BlcyBhbmQgaW50ZXJmYWNlIHRvIHNlbGVjdCB0aGVtIikKPiBT
aWduZWQtb2ZmLWJ5OiBOaWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5jb20+CgpMR1RNLgoKUmV2aWV3
ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+
IC0tLQo+IENoYW5nZXMgaW4gdjI6IFJlbmFtZSB0aGUgY3B1aHBfc3RhdGUgb2Ygc2JpIGlwaQo+
Cj4gIGFyY2gvcmlzY3Yva2VybmVsL3NiaS1pcGkuYyB8IDIgKy0KPiAgaW5jbHVkZS9saW51eC9j
cHVob3RwbHVnLmggIHwgMSArCj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLWlwaS5j
IGIvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLWlwaS5jCj4gaW5kZXggMTAyNmUyMjk1NWNjLi4wY2M1
NTU5YzA4ZDggMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLWlwaS5jCj4gKysr
IGIvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLWlwaS5jCj4gQEAgLTcxLDcgKzcxLDcgQEAgdm9pZCBf
X2luaXQgc2JpX2lwaV9pbml0KHZvaWQpCj4gICAgICAgICAgKiB0aGUgbWFza2luZy91bm1hc2tp
bmcgb2YgdmlydHVhbCBJUElzIGlzIGRvbmUKPiAgICAgICAgICAqIHZpYSBnZW5lcmljIElQSS1N
dXgKPiAgICAgICAgICAqLwo+IC0gICAgICAgY3B1aHBfc2V0dXBfc3RhdGUoQ1BVSFBfQVBfT05M
SU5FX0RZTiwKPiArICAgICAgIGNwdWhwX3NldHVwX3N0YXRlKENQVUhQX0FQX0lSUV9SSVNDVl9T
QklfSVBJX1NUQVJUSU5HLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgImlycWNoaXAvc2Jp
LWlwaTpzdGFydGluZyIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICBzYmlfaXBpX3N0YXJ0
aW5nX2NwdSwgTlVMTCk7Cj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9jcHVob3RwbHVn
LmggYi9pbmNsdWRlL2xpbnV4L2NwdWhvdHBsdWcuaAo+IGluZGV4IDdhNTc4NWY0MDViNi4uMGE4
ZmQ0YTNkMDRjIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvY3B1aG90cGx1Zy5oCj4gKysr
IGIvaW5jbHVkZS9saW51eC9jcHVob3RwbHVnLmgKPiBAQCAtMTQ3LDYgKzE0Nyw3IEBAIGVudW0g
Y3B1aHBfc3RhdGUgewo+ICAgICAgICAgQ1BVSFBfQVBfSVJRX0xPT05HQVJDSF9TVEFSVElORywK
PiAgICAgICAgIENQVUhQX0FQX0lSUV9TSUZJVkVfUExJQ19TVEFSVElORywKPiAgICAgICAgIENQ
VUhQX0FQX0lSUV9SSVNDVl9JTVNJQ19TVEFSVElORywKPiArICAgICAgIENQVUhQX0FQX0lSUV9S
SVNDVl9TQklfSVBJX1NUQVJUSU5HLAo+ICAgICAgICAgQ1BVSFBfQVBfQVJNX01WRUJVX0NPSEVS
RU5DWSwKPiAgICAgICAgIENQVUhQX0FQX1BFUkZfWDg2X0FNRF9VTkNPUkVfU1RBUlRJTkcsCj4g
ICAgICAgICBDUFVIUF9BUF9QRVJGX1g4Nl9TVEFSVElORywKPiAtLQo+IDIuMzQuMQo+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
