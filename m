Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CD1EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 18:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tGXQ6ayVmjYfsi9NGkOv+RLYuWZGAejHyvverrZTyQk=; b=puIZrFmROalnuQ
	//1QVJ++do2GAEwTukcOZ0pywa1FTCcSEgFPBMBJHLZZq6+9H5WifEZQ35TeFxjCC0Wy04Rxtf8rF
	NV0MFiH4VBmIVT5dMaaZMi1GqhnxpTqPAjazJD01kAn4xDXyBX1+fkhKIWgoYGkcsk54sq+WY2sTP
	GXbN5QFpjBqSi0rSFQQCxy4Nl8ozh/M+F5PWcaKf+2arX+W90pX/mEgv3qS239rhYMitQGUjQONZi
	Zdil6ngCWPOJgvEacBmO8KtG36Du7/+Z3s3TgvCWz7KbeamhuXu40LdW08enXwzn5JObRlKnlriSb
	6FbCQ0Kih69XotQItpKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKNd1-006z98-2o;
	Fri, 14 Jul 2023 18:34:55 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKNcz-006z7N-1J
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 18:34:54 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3460770afe2so14475ab.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jul 2023 11:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689359690; x=1691951690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MoxXHdLDuf7uBFW6SzS0r7koKHamZIMQJhfLSozBhPo=;
        b=CoJVUT8LU2AtfsX0295LW0wALbl6vjYJVVvw4PYNsoOUACUrTE5e7vF2/JNBuTVytu
         1YN5mfJ5LmOjGrkFWCjokami+/m/20rMXkXJE+kyg8lWJV1fM/eT2A5BSdTJVC10fUVP
         m/jcur+F1HfXOrnBNG3g4Z19YMly7vmf9OEGqCUncUEzhxkpRosdoOP4mfNJoabA4aFt
         bFSjNtQ8UDmaME5akhRaiUq6QjCF6ow/oqaG67xGj8OmK0bkihegJlrVL02S3uaHb+gx
         KJOLY1eELEHcsQjQJkzgzu2IlUsCPPJn84DLtUo2c4kVvsCgeYxQ7CLrtnN9yNYVzjuO
         7vsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689359690; x=1691951690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MoxXHdLDuf7uBFW6SzS0r7koKHamZIMQJhfLSozBhPo=;
        b=DnVbVdLTy7DmADI8NSUXVwmVuyKrXjc4+/KXuD/Lpi8bJ9qiRpI1jFR+xcZQAvvhNI
         yub3Tnga4pMQa3pNclvMMSx8WEplIKwyufWtY7Tcqn22ifri9MJ9hzaEFzpaZyOZP6DG
         FcrETCfy5dzs5+vfH2P+9ozF2o5RfJ6f4atw6r22LbL2hMyGXL5y7WX4ERs1EtQBPnsN
         v1No7he/1q8tK29oqbGYnMjdAK/1P1N5g7UKXU+NVIFjtiBWTkjWZK6BNFzNEM7K6ouz
         Zfoz5IKEeTs7sIA57UpcD+hGYcROkyKFvoemPCd7kBLqgjke1CDEJ68aYCuP1IvqNfFr
         IJ1A==
X-Gm-Message-State: ABy/qLbRDxWLUjO2KDOh37ptE/KExANYOZz8u5+PRkmHny/PLhWXLeDk
	BmYReEVb9vztbuBhvyPks6wQ3QTLbEzqd3lzj2TdvZ5QVYaGV/B9WIU=
X-Google-Smtp-Source: APBJJlFBXB7QiI9ztuQ6QNS2GQgouY4NGeveevYonN6Nbqt7+SK1nGopO9WtPJnQWR/2BpnoHFgPXaVz7Pqdzg6CKF4=
X-Received: by 2002:a05:6e02:1a61:b0:33d:8f9f:9461 with SMTP id
 w1-20020a056e021a6100b0033d8f9f9461mr972322ilv.18.1689359690226; Fri, 14 Jul
 2023 11:34:50 -0700 (PDT)
MIME-Version: 1.0
References: <1687443219-11946-1-git-send-email-yangtiezhu@loongson.cn> <1412dbaf-56f4-418b-85ea-681b1c44cc26@app.fastmail.com>
In-Reply-To: <1412dbaf-56f4-418b-85ea-681b1c44cc26@app.fastmail.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 14 Jul 2023 11:34:38 -0700
Message-ID: <CAP-5=fWmPQ9vtH1t9pSPCPBiOFxQQe43C7Bk4amLS08ASAnwGg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Unify uapi bitsperlong.h
To: Arnd Bergmann <arnd@arndb.de>, Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	loongarch@lists.linux.dev, Linux-Arch <linux-arch@vger.kernel.org>, bpf@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_113453_449893_DD70D7FB 
X-CRM114-Status: GOOD (  21.81  )
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

T24gVGh1LCBKdW4gMjIsIDIwMjMgYXQgODoxMOKAr0FNIEFybmQgQmVyZ21hbm4gPGFybmRAYXJu
ZGIuZGU+IHdyb3RlOgo+Cj4gT24gVGh1LCBKdW4gMjIsIDIwMjMsIGF0IDE2OjEzLCBUaWV6aHUg
WWFuZyB3cm90ZToKPiA+IHYzOgo+ID4gICAtLSBDaGVjayB0aGUgZGVmaW5pdGlvbiBvZiBfX0JJ
VFNfUEVSX0xPTkcgZmlyc3QgYXQKPiA+ICAgICAgdGhlIGJlZ2lubmluZyBvZiB1YXBpL2FzbS1n
ZW5lcmljL2JpdHNwZXJsb25nLmgKPiA+CgpUaGFua3MgZm9yIGRvaW5nIHRoaXMgY2xlYW51cCEg
SSBqdXN0IHdhbnRlZCB0byByZXBvcnQgYW4gaXNzdWUgSSByYW4KaW50byB3aXRoIGJ1aWxkaW5n
IHRoZSBMaW51eCBwZXJmIHRvb2wuIFRoZSBoZWFkZXIgZ3VhcmQgaW46CnRvb2xzL2luY2x1ZGUv
YXNtLWdlbmVyaWMvYml0c3BlcmxvbmcuaApodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS90b29scy9pbmNsdWRlL2Fz
bS1nZW5lcmljL2JpdHNwZXJsb25nLmgKCkNhdXNlZCBhbiBpc3N1ZSB3aXRoIGJ1aWxkaW5nOgp0
b29scy9wZXJmL3V0aWwvY3MtZXRtLmMKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvdG9vbHMvcGVyZi91dGlsL2Nz
LWV0bS5jCgpUaGUgaXNzdWUgd2FzIHRoYXQgY3MtZXRtLmMgd291bGQgI2luY2x1ZGUgYSBzeXN0
ZW0gaGVhZGVyLCB3aGljaAp3b3VsZCB0cmFuc2l0aXZlbHkgaW5jbHVkZSBhIGhlYWRlciB3aXRo
IHRoZSBzYW1lIGhlYWRlciBndWFyZC4gVGhpcwpsZWQgdG8gdGhlIHRvb2xzL2luY2x1ZGUvYXNt
LWdlbmVyaWMvYml0c3BlcmxvbmcuaCBiZWluZyBpZ25vcmVkIGFuZAp0aGUgY29tcGlsYXRpb24g
b2YgdG9vbHMvcGVyZi91dGlsL2NzLWV0bS5jIGZhaWxpbmcgZHVlIHRvIGEgbWlzc2luZwpkZWZp
bmUuIE15IGxvY2FsIHdvcmthcm91bmQgaXM6CgpgYGAKZGlmZiAtLWdpdCBhL3Rvb2xzL2luY2x1
ZGUvYXNtLWdlbmVyaWMvYml0c3BlcmxvbmcuaApiL3Rvb2xzL2luY2x1ZGUvYXNtLWdlbmVyaWMv
Yml0c3BlcmxvbmcuaAppbmRleCAyMDkzZDU2ZGRkMTEuLjg4NTA4YTM1Y2I0NSAxMDA2NDQKLS0t
IGEvdG9vbHMvaW5jbHVkZS9hc20tZ2VuZXJpYy9iaXRzcGVybG9uZy5oCisrKyBiL3Rvb2xzL2lu
Y2x1ZGUvYXNtLWdlbmVyaWMvYml0c3BlcmxvbmcuaApAQCAtMSw2ICsxLDYgQEAKLyogU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KLSNpZm5kZWYgX19BU01fR0VORVJJQ19CSVRT
X1BFUl9MT05HCi0jZGVmaW5lIF9fQVNNX0dFTkVSSUNfQklUU19QRVJfTE9ORworI2lmbmRlZiBf
X0xJTlVYX1RPT0xTX0FTTV9HRU5FUklDX0JJVFNfUEVSX0xPTkcKKyNkZWZpbmUgX19MSU5VWF9U
T09MU19BU01fR0VORVJJQ19CSVRTX1BFUl9MT05HCiNpbmNsdWRlIDx1YXBpL2FzbS1nZW5lcmlj
L2JpdHNwZXJsb25nLmg+CkBAIC0yMSw0ICsyMSw0IEBACiNkZWZpbmUgc21hbGxfY29uc3RfbmJp
dHMobmJpdHMpIFwKKF9fYnVpbHRpbl9jb25zdGFudF9wKG5iaXRzKSAmJiAobmJpdHMpIDw9IEJJ
VFNfUEVSX0xPTkcgJiYgKG5iaXRzKSA+IDApCi0jZW5kaWYgLyogX19BU01fR0VORVJJQ19CSVRT
X1BFUl9MT05HICovCisjZW5kaWYgLyogX19MSU5VWF9UT09MU19BU01fR0VORVJJQ19CSVRTX1BF
Ul9MT05HICovCmBgYAoKSSdtIG5vdCBzdXJlIGlmIGEgd2lkZXIgZml4IGlzIG5lY2Vzc2FyeSBm
b3IgdGhpcywgYnV0IEkgdGhvdWdodCBpdAp3b3J0aHdoaWxlIHRvIHJlcG9ydCB0aGF0IHRoZXJl
IGFyZSBwb3RlbnRpYWwgaXNzdWVzLiBJIGRvbid0IHRoaW5rIHdlCmNhbiB1c2UgI3ByYWdtYSBv
bmNlLCBhcyBhbiBhbHRlcm5hdGl2ZSB0byBoZWFkZXIgZ3VhcmRzLCB0byBhdm9pZAp0aGlzIGtp
bmQgb2YgbmFtZSBjb2xsaXNpb24uCgpUaGFua3MsCklhbgoKCj4gPiB2MjoKPiA+ICAgLS0gQ2hl
Y2sgX19DSEFSX0JJVF9fIGFuZCBfX1NJWkVPRl9MT05HX18gcmF0aGVyIHRoYW4KPiA+ICAgICAg
X19hYXJjaDY0X18sIF9fcmlzY3YsIF9fbG9vbmdhcmNoX18sIHRoYW5rcyBSdW95YW8KPiA+ICAg
LS0gVXBkYXRlIHRoZSBjb2RlIGNvbW1lbnQgYW5kIGNvbW1pdCBtZXNzYWdlCj4gPgo+ID4gdjE6
Cj4gPiAgIC0tIFJlYmFzZSBvbiA2LjQtcmM2Cj4gPiAgIC0tIE9ubHkgdW5pZnkgdWFwaSBiaXRz
cGVybG9uZy5oIGZvciBhcm02NCwgcmlzY3YgYW5kIGxvb25nYXJjaAo+ID4gICAtLSBSZW1vdmUg
dWFwaSBiaXRzcGVybG9uZy5oIG9mIGhleGFnb24gYW5kIG1pY3JvYmxhemUgaW4gYSBuZXcgcGF0
Y2gKPiA+Cj4gPiBIZXJlIGlzIHRoZSBSRkMgcGF0Y2g6Cj4gPiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC1hcmNoLzE2ODM2MTU5MDMtMTA4NjItMS1naXQtc2VuZC1lbWFpbC15YW5ndGll
emh1QGxvb25nc29uLmNuLwo+Cj4gSSd2ZSBhcHBsaWVkIHRoZXNlIHRvIHRoZSBhc20tZ2VuZXJp
YyB0cmVlIG5vdwo+Cj4gVGhhbmtzLAo+Cj4gICAgQXJuZAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
