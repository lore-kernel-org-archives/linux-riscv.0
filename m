Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0B3C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 19:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mdbGbbWpHdV+wclxJ2WG+cRYItccR586SNa/o9iwFUA=; b=JrBUbOUTtUQXys
	cmCuZmPAnESEuucCULByKtQy5R2+Fx+lMI6ZyDtSNOOyepr8id3nkdHk9xFmAvtAzOyXcss3R3kCq
	xfISqxsTNONMiTj+GLtAXB7xUXNxXP8hlyTN1z3QGVPm0NcPPsSqFPfUedYMq5cVzSgnlLePybA/V
	FcVlrGz7Ak5KuOGNMrf8IvHfWaSZ/Cv8W7hdzypA4JoCs0soySP2UUaipkmi+tIT7cvj9kKor2YLb
	9NpYF3Yt+RYE6gphwcZRdU2OH+SCagkzCBf/8FZhGM6AwuBVQT92DSAVXkCE8mf5iOevjQraflf0u
	Fk1sxNc+JWA1xvI6skMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVGXN-00000005G9m-0Ycn;
	Wed, 31 Jan 2024 19:46:21 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVGXK-00000005G8g-2DaS
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 19:46:19 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50eac018059so143494e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 11:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1706730376; x=1707335176; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ju5bATM8KiUO0jBRP33Dw7hIFUoga9+pxbAgY3MbY84=;
        b=H83gLyQFZ2L6rfSlpIKOpF/4W5rQk1dgWoxUYKGODeSMh1A/1o89ltJftRh+8kQW99
         Es689pGGvnB1liniklq4dX4HLIPKqcxDv+w1otJulhVH5lEovcknBk3St7iKrpogVD4M
         8Msd8Nr8gCNwy2RaIIV+OHh8kHMIzn/AMAVR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706730376; x=1707335176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ju5bATM8KiUO0jBRP33Dw7hIFUoga9+pxbAgY3MbY84=;
        b=wc7+GHNoq1vkyN6D16v0570waJ676WsOvlpdywZmV0DJYTR/o3B1pLyH57o8xZxbDu
         hrxD4uDkocMjp6ZkfOqto4fYhft7WuM0xZVrnFs68DotM1K3mZFMA6/9zQzklnS6urGy
         hec6UH88roJCZqweGRy9D7GGxAMa+FJyet46y58hbLwJi4kFPKpraBLXZuPCNKAwRqU+
         d5LrexcLY/r1Pmh4aWkxOmibh4JVrfz1pj8bqhn9tbCfST1R4vYby9GAh9BPuJp+2eE3
         wiWYgjaBuDv4vPqDHA4HlW7A1qm9J6bBxRhmc1/JKUG/wOt7tJ20GTCtNpxNkHXxAMwX
         +lvQ==
X-Gm-Message-State: AOJu0YyCqOA1snDPUpQSNpOg+mh6lAN2IOzsLuIjoBC+PxUYfxXHEKMR
	evOi7CbaRn8fufh5qlLRrhfRPZhFPBVXj3OS5tpNjtdNmUANRuTnmwfrU2eECMcWxlduZMmaMrW
	h4fjlBfZvG83bwVnCboT9ngQY0mwDsHgUQzNY
X-Google-Smtp-Source: AGHT+IH1DyRIVnBR6Ddg8J/0DQkkIegP5eEb0719pu8eT+n1vbLFdhhNI3HXt14yX/4unJHHZTyjGCLLgnolwn3xQe0=
X-Received: by 2002:a19:644b:0:b0:511:1af6:4b74 with SMTP id
 b11-20020a19644b000000b005111af64b74mr261712lfj.23.1706730376675; Wed, 31 Jan
 2024 11:46:16 -0800 (PST)
MIME-Version: 1.0
References: <20240131120511.200338-5-ajones@ventanamicro.com> <20240131120511.200338-8-ajones@ventanamicro.com>
In-Reply-To: <20240131120511.200338-8-ajones@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 31 Jan 2024 11:46:05 -0800
Message-ID: <CAOnJCUJ-COpQcs+Baf44qGfTaon9xb6=fo9+DBKHvgMtBNzdPQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] RISC-V: KVM: Use correct restricted types
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_114618_606507_FB1783F3 
X-CRM114-Status: GOOD (  14.05  )
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

T24gV2VkLCBKYW4gMzEsIDIwMjQgYXQgNDowNeKAr0FNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gX19sZTMyIGFuZCBfX2xlNjQgdHlwZXMgc2hvdWxk
IGJlIHVzZWQgd2l0aCBsZTMyX3RvX2NwdSgpIGFuZAo+IGxlNjRfdG9fY3B1KCkgYW5kIF9fdXNl
ciBpcyBuZWVkZWQgZm9yIHBvaW50ZXJzIHJlZmVyZW5jaW5nCj4gZ3Vlc3QgbWVtb3J5LCBhcyBz
cGFyc2UgaGVscGZ1bGx5IHBvaW50cyBvdXQuCj4KPiBGaXhlczogZTlmMTJiNWZmZjhhICgiUklT
Qy1WOiBLVk06IEltcGxlbWVudCBTQkkgU1RBIGV4dGVuc2lvbiIpCj4gUmVwb3J0ZWQtYnk6IGtl
cm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDI0MDEwMjAxNDIubHdGRURLNXYtbGtwQGludGVsLmNv
bS8KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29t
Pgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9zdGEuYyB8IDIwICsrKysrKysrKysr
Ky0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3N0YS5jIGIvYXJj
aC9yaXNjdi9rdm0vdmNwdV9zYmlfc3RhLmMKPiBpbmRleCAwMWYwOWZlOGMzYjAuLmQ4Y2Y5Y2Ey
OGM2MSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9zdGEuYwo+ICsrKyBi
L2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3N0YS5jCj4gQEAgLTI2LDggKzI2LDEyIEBAIHZvaWQg
a3ZtX3Jpc2N2X3ZjcHVfcmVjb3JkX3N0ZWFsX3RpbWUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+
ICB7Cj4gICAgICAgICBncGFfdCBzaG1lbSA9IHZjcHUtPmFyY2guc3RhLnNobWVtOwo+ICAgICAg
ICAgdTY0IGxhc3Rfc3RlYWwgPSB2Y3B1LT5hcmNoLnN0YS5sYXN0X3N0ZWFsOwo+IC0gICAgICAg
dTMyICpzZXF1ZW5jZV9wdHIsIHNlcXVlbmNlOwo+IC0gICAgICAgdTY0ICpzdGVhbF9wdHIsIHN0
ZWFsOwo+ICsgICAgICAgX19sZTMyIF9fdXNlciAqc2VxdWVuY2VfcHRyOwo+ICsgICAgICAgX19s
ZTY0IF9fdXNlciAqc3RlYWxfcHRyOwo+ICsgICAgICAgX19sZTMyIHNlcXVlbmNlX2xlOwo+ICsg
ICAgICAgX19sZTY0IHN0ZWFsX2xlOwo+ICsgICAgICAgdTMyIHNlcXVlbmNlOwo+ICsgICAgICAg
dTY0IHN0ZWFsOwo+ICAgICAgICAgdW5zaWduZWQgbG9uZyBodmE7Cj4gICAgICAgICBnZm5fdCBn
Zm47Cj4KPiBAQCAtNDcsMjIgKzUxLDIyIEBAIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfcmVjb3JkX3N0
ZWFsX3RpbWUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICAgICAgICAgICAgICAgICByZXR1cm47
Cj4gICAgICAgICB9Cj4KPiAtICAgICAgIHNlcXVlbmNlX3B0ciA9ICh1MzIgKikoaHZhICsgb2Zm
c2V0X2luX3BhZ2Uoc2htZW0pICsKPiArICAgICAgIHNlcXVlbmNlX3B0ciA9IChfX2xlMzIgX191
c2VyICopKGh2YSArIG9mZnNldF9pbl9wYWdlKHNobWVtKSArCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIG9mZnNldG9mKHN0cnVjdCBzYmlfc3RhX3N0cnVjdCwgc2VxdWVuY2UpKTsK
PiAtICAgICAgIHN0ZWFsX3B0ciA9ICh1NjQgKikoaHZhICsgb2Zmc2V0X2luX3BhZ2Uoc2htZW0p
ICsKPiArICAgICAgIHN0ZWFsX3B0ciA9IChfX2xlNjQgX191c2VyICopKGh2YSArIG9mZnNldF9p
bl9wYWdlKHNobWVtKSArCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9mZnNldG9mKHN0
cnVjdCBzYmlfc3RhX3N0cnVjdCwgc3RlYWwpKTsKPgo+IC0gICAgICAgaWYgKFdBUk5fT04oZ2V0
X3VzZXIoc2VxdWVuY2UsIHNlcXVlbmNlX3B0cikpKQo+ICsgICAgICAgaWYgKFdBUk5fT04oZ2V0
X3VzZXIoc2VxdWVuY2VfbGUsIHNlcXVlbmNlX3B0cikpKQo+ICAgICAgICAgICAgICAgICByZXR1
cm47Cj4KPiAtICAgICAgIHNlcXVlbmNlID0gbGUzMl90b19jcHUoc2VxdWVuY2UpOwo+ICsgICAg
ICAgc2VxdWVuY2UgPSBsZTMyX3RvX2NwdShzZXF1ZW5jZV9sZSk7Cj4gICAgICAgICBzZXF1ZW5j
ZSArPSAxOwo+Cj4gICAgICAgICBpZiAoV0FSTl9PTihwdXRfdXNlcihjcHVfdG9fbGUzMihzZXF1
ZW5jZSksIHNlcXVlbmNlX3B0cikpKQo+ICAgICAgICAgICAgICAgICByZXR1cm47Cj4KPiAtICAg
ICAgIGlmICghV0FSTl9PTihnZXRfdXNlcihzdGVhbCwgc3RlYWxfcHRyKSkpIHsKPiAtICAgICAg
ICAgICAgICAgc3RlYWwgPSBsZTY0X3RvX2NwdShzdGVhbCk7Cj4gKyAgICAgICBpZiAoIVdBUk5f
T04oZ2V0X3VzZXIoc3RlYWxfbGUsIHN0ZWFsX3B0cikpKSB7Cj4gKyAgICAgICAgICAgICAgIHN0
ZWFsID0gbGU2NF90b19jcHUoc3RlYWxfbGUpOwo+ICAgICAgICAgICAgICAgICB2Y3B1LT5hcmNo
LnN0YS5sYXN0X3N0ZWFsID0gUkVBRF9PTkNFKGN1cnJlbnQtPnNjaGVkX2luZm8ucnVuX2RlbGF5
KTsKPiAgICAgICAgICAgICAgICAgc3RlYWwgKz0gdmNwdS0+YXJjaC5zdGEubGFzdF9zdGVhbCAt
IGxhc3Rfc3RlYWw7Cj4gICAgICAgICAgICAgICAgIFdBUk5fT04ocHV0X3VzZXIoY3B1X3RvX2xl
NjQoc3RlYWwpLCBzdGVhbF9wdHIpKTsKPiAtLQo+IDIuNDMuMAo+CgpSZXZpZXdlZC1ieTogQXRp
c2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+CgotLSAKUmVnYXJkcywKQXRpc2gKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
