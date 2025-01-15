Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBB2C02183
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 11:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eNV5fL965YHsG4aqs5QpvJ/Yxz+CJVBYzAocORV/qgI=; b=LJv4dHuujmqwXm
	PXlnvakw/nTHbjKrDkixVwuwvC5FNcAwgxeJNrzKdLuuzabmkgWJzSsMwF1ys+HhBuqqKni10AACD
	eWhqZnRCuVLVaT31uVxJQZPdJmwEOR6N0RvdgzG6P8t5zZ6XSpT9q9wYAdfMljDrMAezLRD2KZpKT
	/49Or2JHVr7T+TYFr95Z+keuR0A4EV+6jC2C9V7f0n4vKyQl6bfIwK6xxdqiLMAtA8iAqwVO020sU
	mS/CIA1sBnVFATz/939zZI85mFywXH+qUVm5kKu6wDptZuTmAApFOfRtVUMTmbfE4LlyB4KqLTFVx
	ibLokKMuHYFt01reDnuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1nF-0000000Bj97-27rk;
	Wed, 15 Jan 2025 11:42:41 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1k5-0000000BiYO-2Hxw
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 11:39:26 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3ce8a4e95f3so2796975ab.2
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jan 2025 03:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1736941164; x=1737545964; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3NJb8/QviTFpaGoLJshRwHi5RygmgVidbA5umRMfIA=;
        b=21Ls/h/NlEAoEQyt9vE6MROBW+psqh3sewCJTvTHkA7q7kmGKuR5cBfsRAoaDRkF4w
         FK0ZsdD9KBpKbd2b/kpPhPXas1mkraQJEZOqGcE0QYfxYOpOstwx+zV+/PMNjbcFt1An
         8AIWseavSkmxDmt6rBq1d0G4xkZBlesPj4RFA0KMVeFW+1kjnETXHuB4grVw6ElzrKTh
         AaeQ5MMbNjwjgeAP/xM6brbo5ckVSS8ytokNhChL58rAGgevejNROlRCEqOlQaFIoBfz
         LVGuXuGq0EKmEsm/logQXbTL8iDG3EdqoM7aho7yHZddCu9bFq1sC+rSfCAuu4z4fY2m
         zH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736941164; x=1737545964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g3NJb8/QviTFpaGoLJshRwHi5RygmgVidbA5umRMfIA=;
        b=vApyn+6a0J3BTMSOdxDQuvO2gI6yS7MdpjWGZ4dP7Tjwu4N0dp5w4cu1OfmVKWkgP9
         0JI8qEAt3nsEVkv/xs3TqCo50hKS9gbmC8tXa7Z7gvuN2F2sfEuKG3PfYzq2O1NPOxKM
         9FyNI/tRvk29zkrmm+AjA+zEB9+9wnJETdqHwzr/8EsPINdT/Y/iswUvScAqBUUUN8sS
         uJE0fgR9BNEmqq08eNLPhhRbVDBxMPkSk7L2Rodxf/HQOJSwKTtdWqVK2EOXkPpPkqb5
         07KqYAynqywr0tVXdtT2C2TZFAZb/Ie6CPS40HpB4KwYu6QmuIzCQfAfs5AlmGdjbxfz
         x+sQ==
X-Forwarded-Encrypted: i=1; AJvYcCUakvfFZ6qgKYZmOjiMaoGqAyKtFE9UBaBR4dhpV2ncaNEj+nFoDykK9pDPHTGkAnAFlIzkmSC/vp+GUA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3xGdSfuVJmpLHg2x/53QArwxGHxh3uQZYMtc1gkzgvcqE0Tzx
	E3ydtezKHqms9a8seS7+yp0yCp0T61WYAnlimdo5LnRiEq56thSSRvWxevV9KyACEyhXhahAVhd
	R4yO5LOkPJU2o4Uclj6LE5vi3X1xwEky05uXwUA==
X-Gm-Gg: ASbGncvFi0p9oqK1DJwN6ShIL7ySfYvxCu1bJjUWwEJgkhVEmtWfDIBrQr4ikXwXDvU
	8Vfil/f76NWUMaYJ4r43xcMMvFzuScOH2+lX7z7id
X-Google-Smtp-Source: AGHT+IHD1DQk3JaMlafRBXB5zfTN1P/yRg8uK4f9imu6ZwPM5BLXJo0jcHAYTp4KFcavph8aq9IXsxjn6Cmup7WlSQA=
X-Received: by 2002:a92:ca09:0:b0:3ce:6628:3d0 with SMTP id
 e9e14a558f8ab-3ce66280605mr143948115ab.17.1736941164136; Wed, 15 Jan 2025
 03:39:24 -0800 (PST)
MIME-Version: 1.0
References: <20250113150933.65121-1-luxu.kernel@bytedance.com> <20250113150933.65121-2-luxu.kernel@bytedance.com>
In-Reply-To: <20250113150933.65121-2-luxu.kernel@bytedance.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 15 Jan 2025 17:09:12 +0530
X-Gm-Features: AbW1kva5TGEwv54lot19fpo6B9JbL-hccRFKguPjztXD0Qt56NacdZ1bynM_4-k
Message-ID: <CAAhSdy0qH=ofaKuohLHpyPFU87Q2pG0h8Fk33Pum28WMPv-Www@mail.gmail.com>
Subject: Re: [PATCH 1/5] irqchip/riscv-intc: Balance priority and fairness
 during irq handling
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: daniel.lezcano@linaro.org, tglx@linutronix.de, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, lihangjing@bytedance.com, xieyongji@bytedance.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_033925_791933_66B8CC75 
X-CRM114-Status: GOOD (  23.99  )
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

T24gTW9uLCBKYW4gMTMsIDIwMjUgYXQgODozOeKAr1BNIFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRl
ZGFuY2UuY29tPiB3cm90ZToKPgo+IEJvdGggY3NyIGNhdXNlIGFuZCBjc3IgdG9waSByZWNvcmQg
dGhlIHBlbmRpbmcgYml0IHdpdGggdGhlIGhpZ2hlc3QKPiBwcmlvcml0eS4gSWYgaW50ZXJydXB0
cyB3aXRoIGhpZ2ggcHJpb3JpdHkgYXJyaXZlIGZyZXF1ZW50bHkgd2l0aGluIGEKPiBjZXJ0YWlu
IHBlcmlvZCBvZiB0aW1lLCB0aGUgaW50ZXJydXB0cyB3aXRoIGxvdyBwcmlvcml0eSB3b24ndCBn
ZXQgYQo+IGNoYW5jZSB0byBiZSBoYW5kbGVkLgo+Cj4gRm9yIGV4YW1wbGUsIGlmIGV4dGVybmFs
IGludGVycnVwdHMgYW5kIHNvZnR3YXJlIGludGVycnVwdHMgYXJyaXZlIHZlcnkKPiBmcmVxdWVu
dGx5LCB0aGUgdGltZXIgaW50ZXJydXB0cyB3aWxsIG5ldmVyIGJlIGhhbmRsZWQuIFRoZW4gYnVk
ZHkKPiB3YXRjaGRvZyBvbiBhIGJ1ZGR5IENQVSB3aWxsIHJlcG9ydCBhIGhhcmRsb2NrdXAgb24g
dGhlIGN1cnJlbnQgQ1BVIHdoaWxlCj4gY3VycmVudCBDUFUgYWN0dWFsbHkgY2FuIHJlY2VpdmUg
aXJxLgoKUGxhdGZvcm0gd2l0aCBwcm9wZXIgSFcgd2F0Y2hkb2cgd2lsbCBub3Qgc2VlIHRoaXMg
aXNzdWUgYmVjYXVzZSBIVwp3YXRjaGRvZyBpbnRlcnJ1cHQgd2lsbCBiZSBhbiBleHRlcm5hbCBp
bnRlcnJ1cHQuCgpUaGVyZSB3YXMgYW4gZWZmb3J0IHRvIHN0YW5kYXJkaXplIHdhdGNoZG9nIGZv
ciBSSVNDLVYgcGxhdGZvcm1zIGJ1dCBpdCB3YXMKZGVmZXJyZWQgdG8gZnV0dXJlIHN0YW5kYXJk
aXphdGlvbi4gV2Ugc2hvdWxkIHJlc3VtZSB0aG9zZSBkaXNjdXNzaW9ucyB3aXRoaW4KUlZJIGZv
cnVtcy4KCj4KPiBUaGlzIGNvbW1pdCBzb2x2ZXMgdGhpcyBwcm9ibGVtIGJ5IGhhbmRsaW5nIGFs
bCBwZW5kaW5nIGlycXMgaW4gYSByb3VuZC4KPiBEdXJpbmcgZWFjaCByb3VuZCwgdGhpcyBjb21t
aXQgaGFuZGxlcyBwZW5kaW5nIGlycXMgYnkgdGhlaXIgcHJpb3JpdHkuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBYdSBMdSA8bHV4dS5rZXJuZWxAYnl0ZWRhbmNlLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9p
cnFjaGlwL2lycS1yaXNjdi1pbnRjLmMgfCAzMiArKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWludGMuYyBiL2RyaXZl
cnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jCj4gaW5kZXggZjY1M2MxM2RlNjJiLi5iYzJlYzI2
YWE5ZTkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbnRjLmMKPiAr
KysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWludGMuYwo+IEBAIC0yNiwyMCArMjYsNDAg
QEAgc3RhdGljIHVuc2lnbmVkIGludCByaXNjdl9pbnRjX25yX2lycXMgX19yb19hZnRlcl9pbml0
ID0gQklUU19QRVJfTE9ORzsKPiAgc3RhdGljIHVuc2lnbmVkIGludCByaXNjdl9pbnRjX2N1c3Rv
bV9iYXNlIF9fcm9fYWZ0ZXJfaW5pdCA9IEJJVFNfUEVSX0xPTkc7Cj4gIHN0YXRpYyB1bnNpZ25l
ZCBpbnQgcmlzY3ZfaW50Y19jdXN0b21fbnJfaXJxcyBfX3JvX2FmdGVyX2luaXQ7Cj4KPiArc3Rh
dGljIHVuc2lnbmVkIGludCByaXNjdl9wcmlvX2lycXNbXSA9IHsKPiArI2lmZGVmIENPTkZJR19S
SVNDVl9NX01PREUKPiArICAgICAgIElSUV9NX0VYVCwgSVJRX01fU09GVCwgSVJRX01fVElNRVIs
Cj4gKyNlbmRpZgo+ICsgICAgICAgSVJRX1NfRVhULCBJUlFfU19TT0ZULCBJUlFfU19USU1FUiwg
SVJRX1NfR0VYVCwKPiArICAgICAgIElSUV9WU19FWFQsIElSUV9WU19TT0ZULCBJUlFfVlNfVElN
RVIsCj4gKyAgICAgICBJUlFfUE1VX09WRiwKPiArfTsKPiArCj4gIHN0YXRpYyB2b2lkIHJpc2N2
X2ludGNfaXJxKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ICB7Cj4gLSAgICAgICB1bnNpZ25lZCBs
b25nIGNhdXNlID0gcmVncy0+Y2F1c2UgJiB+Q0FVU0VfSVJRX0ZMQUc7Cj4gLQo+IC0gICAgICAg
aWYgKGdlbmVyaWNfaGFuZGxlX2RvbWFpbl9pcnEoaW50Y19kb21haW4sIGNhdXNlKSkKPiAtICAg
ICAgICAgICAgICAgcHJfd2Fybl9yYXRlbGltaXRlZCgiRmFpbGVkIHRvIGhhbmRsZSBpbnRlcnJ1
cHQgKGNhdXNlOiAlbGQpXG4iLCBjYXVzZSk7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIHBlbmRp
bmcgPSBjc3JfcmVhZChDU1JfSVApICYgY3NyX3JlYWQoQ1NSX0lFKTsKPiArICAgICAgIHVuc2ln
bmVkIGludCBpOwo+ICsKPiArICAgICAgIGZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHJpc2N2
X3ByaW9faXJxcyk7IGkrKykKPiArICAgICAgICAgICAgICAgaWYgKHBlbmRpbmcgJiAoMVVMIDw8
IHJpc2N2X3ByaW9faXJxc1tpXSkpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKGdlbmVy
aWNfaGFuZGxlX2RvbWFpbl9pcnEoaW50Y19kb21haW4sIHJpc2N2X3ByaW9faXJxc1tpXSkpCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwcl93YXJuX3JhdGVsaW1pdGVkKCJGYWls
ZWQgdG8gaGFuZGxlIGludGVycnVwdCAoY2F1c2U6ICV1KVxuIiwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmlzY3ZfcHJpb19pcnFzW2ldKTsK
ClRoaXMgaXMgb3ZlcnJpZGluZyB0aGUgYnVpbHRpbiBwcmlvcml0eSBhc3NpZ25tZW50IGZvciBs
b2NhbCBpbnRlcnJ1cHRzIGFzCmRlZmluZWQgYnkgdGhlIFJJU0MtViBwcml2aWxlZ2VkIHNwZWNp
ZmljYXRpb24gZm9yIG5vbi1BSUEgc3lzdGVtcwp3aGljaCBjaGFuZ2VzIHRoZSBleHBlY3RlZCBi
ZWhhdmlvdXIgb24gZXhpc3RpbmcgcGxhdGZvcm1zLgoKPiAgfQo+Cj4gIHN0YXRpYyB2b2lkIHJp
c2N2X2ludGNfYWlhX2lycShzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiAgewo+ICAgICAgICAgdW5z
aWduZWQgbG9uZyB0b3BpOwo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBwZW5kaW5nOwo+ICsgICAg
ICAgdW5zaWduZWQgaW50IGk7Cj4gKwo+ICsgICAgICAgd2hpbGUgKCh0b3BpID0gY3NyX3JlYWQo
Q1NSX1RPUEkpKSkgewo+ICsgICAgICAgICAgICAgICBwZW5kaW5nID0gY3NyX3JlYWQoQ1NSX0lQ
KSAmIGNzcl9yZWFkKENTUl9JRSk7Cj4KPiAtICAgICAgIHdoaWxlICgodG9waSA9IGNzcl9yZWFk
KENTUl9UT1BJKSkpCj4gLSAgICAgICAgICAgICAgIGdlbmVyaWNfaGFuZGxlX2RvbWFpbl9pcnEo
aW50Y19kb21haW4sIHRvcGkgPj4gVE9QSV9JSURfU0hJRlQpOwo+ICsgICAgICAgICAgICAgICBm
b3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShyaXNjdl9wcmlvX2lycXMpOyBpKyspCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgaWYgKHBlbmRpbmcgJiAoMVVMIDw8IHJpc2N2X3ByaW9faXJxc1tp
XSkpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnZW5lcmljX2hhbmRsZV9kb21h
aW5faXJxKGludGNfZG9tYWluLCByaXNjdl9wcmlvX2lycXNbaV0pOwo+ICsgICAgICAgfQoKVGhl
IEFJQSBzcGVjaWZpY2F0aW9uIGFscmVhZHkgcHJvdmlkZXMgYSBtZWNoYW5pc20gdG8gY2hhbmdl
CnByaW9yaXRpZXMgb2YgbG9jYWwgaW50ZXJydXB0cy4gVGhlIGZpcm13YXJlIG9yIGJvb3Rsb2Fk
ZXIgY2FuIGFsd2F5cwpwcm92aWRlIGN1c3RvbSBwcmlvcml0aWVzIHRvIGxvY2FsIGludGVycnVw
dHMuCgpJbiBnZW5lcmFsLCByZXF1aXJpbmcgY2VydGFpbiBsb2NhbCBpbnRlcnJ1cHRzIHRvIGhh
dmUgaGlnaGVyIHByaW9yaXR5IGlzCnBsYXRmb3JtIG9yIHVzZS1jYXNlIHNwZWNpZmljIGFuZCBz
aG91bGQgYmUgZG9uZSBhcyBBSUEgY29uZmlndXJhdGlvbgppbiBmaXJtd2FyZSBvciBib290bG9h
ZGVyLgoKTkFLIHRvIHRoaXMgcGF0Y2ggZnJvbSBteSBzaWRlIHNpbmNlIGl0IGlzIGp1c3QgYWRk
aW5nIGEgc29mdHdhcmUKd29yay1hcm91bmQgZm9yIGEgbWlzc2luZyBzdGFuZGFyZCB3YXRjaGRv
ZyBpbiB0aGUgUklTQy1WCmVjb3N5c3RlbS4KCk9uZSBwb3NzaWJsZSBhcHByb2FjaCBpcyB0byBs
ZXQgcGxhdGZvcm1zIGhhdmUgdGhlaXIgaW1wbGVtZW50YXRpb24Kc3BlY2lmaWMgTS1tb2RlIHdh
dGNoZG9nIGFuZCBmb3Igc3VwZXJ2aXNvciBzb2Z0d2FyZSAoYm90aCBIUyBhbmQKVlMtbW9kZSkg
d2UgY2FuIGhhdmUgU0JJIGJhc2VkIHdhdGNoZG9nIHdoZXJlIHRoZSBzdXBlcnZpc29yCndhdGNo
ZG9nIGV4cGlyeSBpcyBhbiBTU0UgKGhpZ2hlciBwcmlvcml0eSB0aGFuIGFsbCBsb2NhbCBpbnRl
cnJ1cHRzKS4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
