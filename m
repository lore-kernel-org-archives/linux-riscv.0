Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9A0D2FEDD
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 19:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:
	To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mmq02pNJ9dQ0cYHTFz/rMajowRkObmBX92WSFQWelQY=; b=DtpXM4kQXaV4oIEN/xMYK48bQv
	wu+WDYFnP9vp9OxL6u7Z30/g9OFBHanJYAVw48bfDISp0gHNEKmZ4+cl2TGcyOdnMu92sE6pfV+76
	QyiUXHZbMKhuwpAS96nxXJeBbK773imq5vESXh6uoq2oLUPpPx8f++lFAlBZdv4zEvmVAt2jr/o4f
	CGVsHXUamvMhcw06LyLx1WsSIbG4uO0E+JeuBdARI4Q+rrz6Qr+eTWz6npkBNLTCql+CoFtWTmLxT
	6I9B9NN6uEFv6LGK3pxPlZbh2CkSekY/OykTNSuANMTnILdVm5uuSyMEr+Zy0MsbZK0uBT+1moZYA
	xKRKWDPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoqh-0000000Evon-3syO;
	Tue, 27 Jan 2026 19:35:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhT97-00000000931-1iqY
	for linux-riscv@lists.infradead.org;
	Sun, 18 Jan 2026 13:48:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6FA3D6012B
	for <linux-riscv@lists.infradead.org>; Sun, 18 Jan 2026 13:48:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FC67C2BC87
	for <linux-riscv@lists.infradead.org>; Sun, 18 Jan 2026 13:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768744128;
	bh=b7oKuwouvEUpVEfEzzh46p/FY1lbVEx/FpZBnLTd7iw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GjeSPwzkDd38inuXwY8kEw9ERmRYSny3b6qkqjECabwf8n2ZlhVFOegnB2ynKwpYm
	 8Q/BLTe+hUUWllRTIfI5cK0Kjc0z0I4IDU8Z6EZoeRYfP8Ksedj041cDHx9bNFotTY
	 vK3juzq1uauPRr9owd0nesET8jGX91SQoChcnfFlgtllFC9mPT3fA5Dc83WOMKmhqI
	 dUIyEIqPfUCxN07cPi7WDccx/7G5FbjW/rzeLJVTc0aiWJSTvXuovujJLN35bT3oGy
	 VLrYztOQtfw4prWuwz4MgQmbeMHPpM9x6DCuJjhhPdD2zNg+x3534xCZGcPbb+OEgG
	 CCbMFM8maQb8w==
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47ee4539adfso28958715e9.3
        for <linux-riscv@lists.infradead.org>; Sun, 18 Jan 2026 05:48:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVqkf1VREKbJNCMSrKqRWaxrpkv1OIF6iaRShKxokIMxeUxXM+cRMXlt4rePrEXswgpER+455A0IhK8yw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHKM9DNj/T8Vd0+pSE65XHTjc0sZWXXgbq2YmtSYo4bZJN7oXz
	/ix0pTP5q1e8HzxnIwCxFXt24/f3+h/g8rTUpDT3cN9mvBLMs96asVcEdTJDRmy70fMKM99i75e
	VV9DKPsvELAXr+MA95z7eAa0/JzjkV58=
X-Received: by 2002:a05:600c:4f8f:b0:47e:d774:80a6 with SMTP id
 5b1f17b1804b1-4801e34e81fmr111027505e9.34.1768744126568; Sun, 18 Jan 2026
 05:48:46 -0800 (PST)
MIME-Version: 1.0
References: <20260108134855.91341-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260108134855.91341-1-fangyu.yu@linux.alibaba.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 18 Jan 2026 21:48:33 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTX6Rt4jWqrL=Ukxc7hVhTU-_w8D31Xy1XiG4+14ioGdA@mail.gmail.com>
X-Gm-Features: AZwV_QgKmowR8XFaWHkoPffKtgB4a3Q9eiQjtZNQWsL-pLlrDGWPBHMvKHBdc9s
Message-ID: <CAJF2gTTX6Rt4jWqrL=Ukxc7hVhTU-_w8D31Xy1XiG4+14ioGdA@mail.gmail.com>
Subject: Re: [PATCH] iommu/riscv: Add IOTINVAL after updating DDT/PDT entries
To: fangyu.yu@linux.alibaba.com
Cc: tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, ajones@ventanamicro.com, 
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-Mailman-Approved-At: Tue, 27 Jan 2026 11:35:38 -0800
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
Content-Type: multipart/mixed; boundary="===============3240027464737370705=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3240027464737370705==
Content-Type: multipart/alternative; boundary="0000000000005cdc2c0648a9d5b4"

--0000000000005cdc2c0648a9d5b4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 9:49=E2=80=AFPM <fangyu.yu@linux.alibaba.com> wrote:

> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>
> Add riscv_iommu_iodir_iotinval() to perform required TLB and context cach=
e
> invalidations after updating DDT or PDT entries, as mandated by the RISC-=
V
> IOMMU specification (Section 6.3.1 and 6.3.2).
>
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>  drivers/iommu/riscv/iommu.c | 85 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 85 insertions(+)
>
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index d9429097a2b5..2900170133fc 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -996,7 +996,82 @@ static void riscv_iommu_iotlb_inval(struct
> riscv_iommu_domain *domain,
>  }
>
>  #define RISCV_IOMMU_FSC_BARE 0
> +/*
> + * This function sends IOTINVAL commands as required by the RISC-V
> + * IOMMU specification (Section 6.3.1 and 6.3.2 in 1.0 spec version)
> + * after modifying DDT or PDT entries
> + */
> +static void riscv_iommu_iodir_iotinval(struct riscv_iommu_device *iommu,
> +                                   bool inval_pdt, unsigned long iohgatp=
,
> +                                   struct riscv_iommu_dc *dc, struct
> riscv_iommu_pc *pc)
> +{
> +       struct riscv_iommu_command cmd;
>
> +       if (FIELD_GET(RISCV_IOMMU_DC_IOHGATP_MODE, iohgatp) =3D=3D
> +               RISCV_IOMMU_DC_IOHGATP_MODE_BARE) {
> +               if (inval_pdt) {
> +                       /*
> +                        * IOTINVAL.VMA with GV=3DAV=3D0, and PSCV=3D1, a=
nd
> +                        * PSCID=3DPC.PSCID
> +                        */
> +                       riscv_iommu_cmd_inval_vma(&cmd);
> +                       riscv_iommu_cmd_inval_set_pscid(&cmd,
> +                               FIELD_GET(RISCV_IOMMU_PC_TA_PSCID,
> pc->ta));
> +               } else {
> +                       if (FIELD_GET(RISCV_IOMMU_DC_TC_PDTV, dc->tc) || =
(
> +                                   FIELD_GET(RISCV_IOMMU_DC_FSC_MODE,
> dc->fsc) =3D=3D
> +                                   RISCV_IOMMU_DC_FSC_MODE_BARE)) {
> +                               /* IOTINVAL.VMA with GV=3DAV=3DPSCV=3D0 *=
/
> +                               riscv_iommu_cmd_inval_vma(&cmd);
> +                       } else {
> +                               /*
> +                                * IOTINVAL.VMA with GV=3DAV=3D0, and PSC=
V=3D1,
> and
> +                                * PSCID=3DDC.ta.PSCID
> +                                */
> +                               riscv_iommu_cmd_inval_vma(&cmd);
> +                               riscv_iommu_cmd_inval_set_pscid(&cmd,
> +                                       FIELD_GET(RISCV_IOMMU_DC_TA_PSCID=
,
> dc->ta));
> +                       }
> +               }
> +       } else {
> +               if (inval_pdt) {
> +                       /*
> +                        * IOTINVAL.VMA with GV=3D1, AV=3D0, and PSCV=3D1=
, and
> +                        * GSCID=3DDC.iohgatp.GSCID, PSCID=3DPC.PSCID
> +                        */
> +                       riscv_iommu_cmd_inval_vma(&cmd);

+                       riscv_iommu_cmd_inval_set_gscid(&cmd,
> +                               FIELD_GET(RISCV_IOMMU_DC_IOHGATP_GSCID,
> iohgatp));
> +                       riscv_iommu_cmd_inval_set_pscid(&cmd,
> +                               FIELD_GET(RISCV_IOMMU_PC_TA_PSCID,
> pc->ta));
>
The riscv_iommu_cmd_inval_set_pscid() and riscv_iommu_cmd_inval_vma() could
be moved out to prevent duplicate code.


> +               } else {
> +                       /*
> +                        * IOTINVAL.VMA with GV=3D1,AV=3DPSCV=3D0,and
> +                        * GSCID=3DDC.iohgatp.GSCID
> +                        */
> +                       riscv_iommu_cmd_inval_vma(&cmd);
> +                       riscv_iommu_cmd_inval_set_gscid(&cmd,
> +                               FIELD_GET(RISCV_IOMMU_DC_IOHGATP_GSCID,
> iohgatp));
> +
> +                       /*
> +                        * IOTINVAL.GVMA with GV=3D1,AV=3D0,and
> +                        * GSCID=3DDC.iohgatp.GSCID
> +                        */
> +                       /*
> +                        * For now, the Second-Stage feature have not yet
> been merged, so
> +                        * let's comment out the code first.
> +                        */
> +#if 0

+                       riscv_iommu_cmd_send(iommu, &cmd);
> +                       memset(&cmd, 0, sizeof(cmd));
> +                       riscv_iommu_cmd_inval_gvma(&cmd);
> +                       riscv_iommu_cmd_inval_set_gscid(&cmd,
> +                               FIELD_GET(RISCV_IOMMU_DC_IOHGATP_GSCID,
> iohgatp));
> +#endif
>
All the above should be removed from the patch; we don't need draft code.

+               }
> +       }
> +       riscv_iommu_cmd_send(iommu, &cmd);
> +}
>  /*
>   * Update IODIR for the device.
>   *
> @@ -1031,6 +1106,11 @@ static void riscv_iommu_iodir_update(struct
> riscv_iommu_device *iommu,
>                 riscv_iommu_cmd_iodir_inval_ddt(&cmd);
>                 riscv_iommu_cmd_iodir_set_did(&cmd, fwspec->ids[i]);
>                 riscv_iommu_cmd_send(iommu, &cmd);
> +               /*
> +                * For now, the SVA and PASID features have not yet been
> merged, the
> +                * default configuration is inval_pdt=3Dfalse and pc=3DNU=
LL.
> +                */
> +               riscv_iommu_iodir_iotinval(iommu, false, dc->iohgatp, dc,
> NULL);
>
 The riscv_iommu_iodir_iotinval() is the same level as
riscv_iommu_iodir_update(). Could we move it out and put it after
riscv_iommu_iodir_update()?

                sync_required =3D true;
>         }
>
> @@ -1055,6 +1135,11 @@ static void riscv_iommu_iodir_update(struct
> riscv_iommu_device *iommu,
>
Why do you have two riscv_iommu_iodir_update() function definitions?


>                 /* Invalidate device context after update */
>                 riscv_iommu_cmd_iodir_inval_ddt(&cmd);
>                 riscv_iommu_cmd_iodir_set_did(&cmd, fwspec->ids[i]);
> +               /*
> +                * For now, the SVA and PASID features have not yet been
> merged, the
> +                * default configuration is inval_pdt=3Dfalse and pc=3DNU=
LL.
> +                */
> +               riscv_iommu_iodir_iotinval(iommu, false, dc->iohgatp, dc,
> NULL);
>                 riscv_iommu_cmd_send(iommu, &cmd);
>
If IOTLB invalidation occurs before DDT_CACHE invalidation, the IOTLB may
use DDT_CACHE's stall info, which may cause IOTLB invalidation to fail.


>         }
>
> --
> 2.50.1
>
>

--=20
Best Regards
 Guo Ren

--0000000000005cdc2c0648a9d5b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSBnbWFpbF9xdW90ZV9jb250YWluZXIiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJn
bWFpbF9hdHRyIj5PbiBUaHUsIEphbiA4LCAyMDI2IGF0IDk6NDnigK9QTSAmbHQ7PGEgaHJlZj0i
bWFpbHRvOmZhbmd5dS55dUBsaW51eC5hbGliYWJhLmNvbSI+ZmFuZ3l1Lnl1QGxpbnV4LmFsaWJh
YmEuY29tPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9x
dW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29s
aWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij5Gcm9tOiBGYW5neXUgWXUgJmx0
OzxhIGhyZWY9Im1haWx0bzpmYW5neXUueXVAbGludXguYWxpYmFiYS5jb20iIHRhcmdldD0iX2Js
YW5rIj5mYW5neXUueXVAbGludXguYWxpYmFiYS5jb208L2E+Jmd0Ozxicj4NCjxicj4NCkFkZCBy
aXNjdl9pb21tdV9pb2Rpcl9pb3RpbnZhbCgpIHRvIHBlcmZvcm0gcmVxdWlyZWQgVExCIGFuZCBj
b250ZXh0IGNhY2hlPGJyPg0KaW52YWxpZGF0aW9ucyBhZnRlciB1cGRhdGluZyBERFQgb3IgUERU
IGVudHJpZXMsIGFzIG1hbmRhdGVkIGJ5IHRoZSBSSVNDLVY8YnI+DQpJT01NVSBzcGVjaWZpY2F0
aW9uIChTZWN0aW9uIDYuMy4xIGFuZCA2LjMuMikuPGJyPg0KPGJyPg0KU2lnbmVkLW9mZi1ieTog
RmFuZ3l1IFl1ICZsdDs8YSBocmVmPSJtYWlsdG86ZmFuZ3l1Lnl1QGxpbnV4LmFsaWJhYmEuY29t
IiB0YXJnZXQ9Il9ibGFuayI+ZmFuZ3l1Lnl1QGxpbnV4LmFsaWJhYmEuY29tPC9hPiZndDs8YnI+
DQotLS08YnI+DQrCoGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYyB8IDg1ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKys8YnI+DQrCoDEgZmlsZSBjaGFuZ2VkLCA4NSBpbnNl
cnRpb25zKCspPGJyPg0KPGJyPg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9t
bXUuYyBiL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYzxicj4NCmluZGV4IGQ5NDI5MDk3YTJi
NS4uMjkwMDE3MDEzM2ZjIDEwMDY0NDxicj4NCi0tLSBhL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9t
bXUuYzxicj4NCisrKyBiL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYzxicj4NCkBAIC05OTYs
NyArOTk2LDgyIEBAIHN0YXRpYyB2b2lkIHJpc2N2X2lvbW11X2lvdGxiX2ludmFsKHN0cnVjdCBy
aXNjdl9pb21tdV9kb21haW4gKmRvbWFpbiw8YnI+DQrCoH08YnI+DQo8YnI+DQrCoCNkZWZpbmUg
UklTQ1ZfSU9NTVVfRlNDX0JBUkUgMDxicj4NCisvKjxicj4NCisgKiBUaGlzIGZ1bmN0aW9uIHNl
bmRzIElPVElOVkFMIGNvbW1hbmRzIGFzIHJlcXVpcmVkIGJ5IHRoZSBSSVNDLVY8YnI+DQorICog
SU9NTVUgc3BlY2lmaWNhdGlvbiAoU2VjdGlvbiA2LjMuMSBhbmQgNi4zLjIgaW4gMS4wIHNwZWMg
dmVyc2lvbik8YnI+DQorICogYWZ0ZXIgbW9kaWZ5aW5nIEREVCBvciBQRFQgZW50cmllczxicj4N
CisgKi88YnI+DQorc3RhdGljIHZvaWQgcmlzY3ZfaW9tbXVfaW9kaXJfaW90aW52YWwoc3RydWN0
IHJpc2N2X2lvbW11X2RldmljZSAqaW9tbXUsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYm9vbCBpbnZhbF9wZHQsIHVuc2lnbmVkIGxv
bmcgaW9oZ2F0cCw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGMgKmRjLCBzdHJ1Y3QgcmlzY3ZfaW9t
bXVfcGMgKnBjKTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IHJpc2N2X2lvbW11X2Nv
bW1hbmQgY21kOzxicj4NCjxicj4NCivCoCDCoCDCoCDCoGlmIChGSUVMRF9HRVQoUklTQ1ZfSU9N
TVVfRENfSU9IR0FUUF9NT0RFLCBpb2hnYXRwKSA9PTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoFJJU0NWX0lPTU1VX0RDX0lPSEdBVFBfTU9ERV9CQVJFKSB7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgaWYgKGludmFsX3BkdCkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoC8qPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
ICogSU9USU5WQUwuVk1BIHdpdGggR1Y9QVY9MCwgYW5kIFBTQ1Y9MSwgYW5kPGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICogUFNDSUQ9UEMuUFNDSUQ8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKi88YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqByaXNjdl9pb21tdV9jbWRfaW52YWxfdm1hKCZhbXA7Y21kKTs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByaXNjdl9pb21tdV9jbWRf
aW52YWxfc2V0X3BzY2lkKCZhbXA7Y21kLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoEZJRUxEX0dFVChSSVNDVl9JT01NVV9QQ19UQV9QU0NJRCwg
cGMtJmd0O3RhKSk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfSBlbHNlIHs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoRklFTERfR0VUKFJJU0NWX0lP
TU1VX0RDX1RDX1BEVFYsIGRjLSZndDt0YykgfHwgKDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEZJRUxEX0dFVChSSVNDVl9JT01NVV9E
Q19GU0NfTU9ERSwgZGMtJmd0O2ZzYykgPT08YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBSSVNDVl9JT01NVV9EQ19GU0NfTU9ERV9CQVJF
KSkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oC8qIElPVElOVkFMLlZNQSB3aXRoIEdWPUFWPVBTQ1Y9MCAqLzxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJpc2N2X2lvbW11X2NtZF9pbnZhbF92
bWEoJmFtcDtjbWQpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH0g
ZWxzZSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgLyo8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgKiBJT1RJTlZBTC5WTUEgd2l0aCBHVj1BVj0wLCBhbmQgUFNDVj0xLCBhbmQ8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKiBQU0NJRD1EQy50
YS5QU0NJRDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCAqLzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHJpc2N2X2lvbW11X2NtZF9pbnZhbF92bWEoJmFtcDtjbWQpOzxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJpc2N2X2lvbW11X2NtZF9pbnZh
bF9zZXRfcHNjaWQoJmFtcDtjbWQsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgRklFTERfR0VUKFJJU0NWX0lPTU1VX0RDX1RB
X1BTQ0lELCBkYy0mZ3Q7dGEpKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB9PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTxicj4NCivCoCDCoCDCoCDCoH0g
ZWxzZSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKGludmFsX3BkdCkgezxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qPGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICogSU9USU5WQUwuVk1BIHdpdGggR1Y9MSwgQVY9MCwg
YW5kIFBTQ1Y9MSwgYW5kPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
ICogR1NDSUQ9REMuaW9oZ2F0cC5HU0NJRCwgUFNDSUQ9UEMuUFNDSUQ8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKi88YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqByaXNjdl9pb21tdV9jbWRfaW52YWxfdm1hKCZhbXA7Y21kKTs8L2Jsb2Nr
cXVvdGU+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAw
cHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRp
bmctbGVmdDoxZXgiPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmlzY3Zf
aW9tbXVfY21kX2ludmFsX3NldF9nc2NpZCgmYW1wO2NtZCw8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBGSUVMRF9HRVQoUklTQ1ZfSU9NTVVfRENf
SU9IR0FUUF9HU0NJRCwgaW9oZ2F0cCkpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHJpc2N2X2lvbW11X2NtZF9pbnZhbF9zZXRfcHNjaWQoJmFtcDtjbWQsPGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgRklFTERfR0VU
KFJJU0NWX0lPTU1VX1BDX1RBX1BTQ0lELCBwYy0mZ3Q7dGEpKTs8YnI+PC9ibG9ja3F1b3RlPjxk
aXY+VGhlIHJpc2N2X2lvbW11X2NtZF9pbnZhbF9zZXRfcHNjaWQoKSBhbmQgcmlzY3ZfaW9tbXVf
Y21kX2ludmFsX3ZtYSgpIGNvdWxkIGJlIG1vdmVkIG91dCB0byBwcmV2ZW50IGR1cGxpY2F0ZSBj
b2RlLjxicj7CoDwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1h
cmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQs
MjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH0gZWxzZSB7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLyo8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKiBJT1RJTlZBTC5WTUEgd2l0aCBHVj0xLEFW
PVBTQ1Y9MCxhbmQ8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKiBH
U0NJRD1EQy5pb2hnYXRwLkdTQ0lEPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgICovPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmlzY3Zf
aW9tbXVfY21kX2ludmFsX3ZtYSgmYW1wO2NtZCk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgcmlzY3ZfaW9tbXVfY21kX2ludmFsX3NldF9nc2NpZCgmYW1wO2NtZCw8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBGSUVM
RF9HRVQoUklTQ1ZfSU9NTVVfRENfSU9IR0FUUF9HU0NJRCwgaW9oZ2F0cCkpOzxicj4NCis8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvKjxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqIElPVElOVkFMLkdWTUEgd2l0aCBHVj0xLEFWPTAs
YW5kPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICogR1NDSUQ9REMu
aW9oZ2F0cC5HU0NJRDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAq
Lzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qPGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICogRm9yIG5vdywgdGhlIFNlY29uZC1TdGFn
ZSBmZWF0dXJlIGhhdmUgbm90IHlldCBiZWVuIG1lcmdlZCwgc288YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKiBsZXQmIzM5O3MgY29tbWVudCBvdXQgdGhlIGNvZGUg
Zmlyc3QuPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICovPGJyPg0K
KyNpZiAwwqA8L2Jsb2NrcXVvdGU+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHls
ZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0
LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgcmlzY3ZfaW9tbXVfY21kX3NlbmQoaW9tbXUsICZhbXA7Y21kKTs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBtZW1zZXQoJmFtcDtjbWQsIDAsIHNpemVv
ZihjbWQpKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByaXNjdl9p
b21tdV9jbWRfaW52YWxfZ3ZtYSgmYW1wO2NtZCk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgcmlzY3ZfaW9tbXVfY21kX2ludmFsX3NldF9nc2NpZCgmYW1wO2NtZCw8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBGSUVM
RF9HRVQoUklTQ1ZfSU9NTVVfRENfSU9IR0FUUF9HU0NJRCwgaW9oZ2F0cCkpOzxicj4NCisjZW5k
aWY8YnI+PC9ibG9ja3F1b3RlPjxkaXY+QWxsIHRoZSBhYm92ZSBzaG91bGQgYmUgcmVtb3ZlZCBm
cm9tIHRoZSBwYXRjaDsgd2UgZG9uJiMzOTt0IG5lZWQgZHJhZnQgY29kZS48L2Rpdj48ZGl2Pjxi
cj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4
IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFk
ZGluZy1sZWZ0OjFleCI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KK8KgIMKgIMKg
IMKgfTxicj4NCivCoCDCoCDCoCDCoHJpc2N2X2lvbW11X2NtZF9zZW5kKGlvbW11LCAmYW1wO2Nt
ZCk7PGJyPg0KK308YnI+DQrCoC8qPGJyPg0KwqAgKiBVcGRhdGUgSU9ESVIgZm9yIHRoZSBkZXZp
Y2UuPGJyPg0KwqAgKjxicj4NCkBAIC0xMDMxLDYgKzExMDYsMTEgQEAgc3RhdGljIHZvaWQgcmlz
Y3ZfaW9tbXVfaW9kaXJfdXBkYXRlKHN0cnVjdCByaXNjdl9pb21tdV9kZXZpY2UgKmlvbW11LDxi
cj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJpc2N2X2lvbW11X2NtZF9pb2Rpcl9pbnZhbF9k
ZHQoJmFtcDtjbWQpOzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJpc2N2X2lvbW11X2Nt
ZF9pb2Rpcl9zZXRfZGlkKCZhbXA7Y21kLCBmd3NwZWMtJmd0O2lkc1tpXSk7PGJyPg0KwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgcmlzY3ZfaW9tbXVfY21kX3NlbmQoaW9tbXUsICZhbXA7Y21kKTs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvKjxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCAqIEZvciBub3csIHRoZSBTVkEgYW5kIFBBU0lEIGZlYXR1cmVzIGhhdmUgbm90IHlldCBi
ZWVuIG1lcmdlZCwgdGhlPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICogZGVmYXVsdCBj
b25maWd1cmF0aW9uIGlzIGludmFsX3BkdD1mYWxzZSBhbmQgcGM9TlVMTC48YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgKi88YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByaXNjdl9p
b21tdV9pb2Rpcl9pb3RpbnZhbChpb21tdSwgZmFsc2UsIGRjLSZndDtpb2hnYXRwLCBkYywgTlVM
TCk7PGJyPjwvYmxvY2txdW90ZT48ZGl2PsKgVGhlIHJpc2N2X2lvbW11X2lvZGlyX2lvdGludmFs
KCkgaXMgdGhlIHNhbWUgbGV2ZWwgYXMgcmlzY3ZfaW9tbXVfaW9kaXJfdXBkYXRlKCkuIENvdWxk
IHdlIG1vdmUgaXQgb3V0IGFuZCBwdXQgaXQgYWZ0ZXIgcmlzY3ZfaW9tbXVfaW9kaXJfdXBkYXRl
KCk/PC9kaXY+PGRpdj48YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBz
dHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2Io
MjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
c3luY19yZXF1aXJlZCA9IHRydWU7PGJyPg0KwqAgwqAgwqAgwqAgfTxicj4NCjxicj4NCkBAIC0x
MDU1LDYgKzExMzUsMTEgQEAgc3RhdGljIHZvaWQgcmlzY3ZfaW9tbXVfaW9kaXJfdXBkYXRlKHN0
cnVjdCByaXNjdl9pb21tdV9kZXZpY2UgKmlvbW11LDxicj48L2Jsb2NrcXVvdGU+PGRpdj5XaHkg
ZG8geW91IGhhdmUgdHdvIHJpc2N2X2lvbW11X2lvZGlyX3VwZGF0ZSgpIGZ1bmN0aW9uIGRlZmlu
aXRpb25zPzxicj7CoDwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9
Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwy
MDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qIElu
dmFsaWRhdGUgZGV2aWNlIGNvbnRleHQgYWZ0ZXIgdXBkYXRlICovPGJyPg0KwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgcmlzY3ZfaW9tbXVfY21kX2lvZGlyX2ludmFsX2RkdCgmYW1wO2NtZCk7PGJy
Pg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmlzY3ZfaW9tbXVfY21kX2lvZGlyX3NldF9kaWQo
JmFtcDtjbWQsIGZ3c3BlYy0mZ3Q7aWRzW2ldKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAvKjxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqIEZvciBub3csIHRoZSBTVkEgYW5k
IFBBU0lEIGZlYXR1cmVzIGhhdmUgbm90IHlldCBiZWVuIG1lcmdlZCwgdGhlPGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgICogZGVmYXVsdCBjb25maWd1cmF0aW9uIGlzIGludmFsX3BkdD1m
YWxzZSBhbmQgcGM9TlVMTC48YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKi88YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByaXNjdl9pb21tdV9pb2Rpcl9pb3RpbnZhbChpb21tdSwg
ZmFsc2UsIGRjLSZndDtpb2hnYXRwLCBkYywgTlVMTCk7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgcmlzY3ZfaW9tbXVfY21kX3NlbmQoaW9tbXUsICZhbXA7Y21kKTs8YnI+PC9ibG9ja3F1
b3RlPjxkaXY+SWYgSU9UTEIgaW52YWxpZGF0aW9uIG9jY3VycyBiZWZvcmUgRERUX0NBQ0hFIGlu
dmFsaWRhdGlvbiwgdGhlIElPVExCIG1heSB1c2UgRERUX0NBQ0hFJiMzOTtzIHN0YWxsIGluZm8s
IHdoaWNoIG1heSBjYXVzZSBJT1RMQiBpbnZhbGlkYXRpb24gdG8gZmFpbC48YnI+wqA8L2Rpdj48
YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHgg
MC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0
OjFleCI+DQrCoCDCoCDCoCDCoCB9PGJyPg0KPGJyPg0KLS0gPGJyPg0KMi41MC4xPGJyPg0KPGJy
Pg0KPC9ibG9ja3F1b3RlPjwvZGl2PjxkaXY+PGJyIGNsZWFyPSJhbGwiPjwvZGl2PjxkaXY+PGJy
PjwvZGl2PjxzcGFuIGNsYXNzPSJnbWFpbF9zaWduYXR1cmVfcHJlZml4Ij4tLSA8L3NwYW4+PGJy
PjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9zaWduYXR1cmUiPjxkaXYgZGlyPSJsdHIiPkJl
c3QgUmVnYXJkczxicj7CoEd1byBSZW48YnI+PC9kaXY+PC9kaXY+PC9kaXY+DQo=
--0000000000005cdc2c0648a9d5b4--


--===============3240027464737370705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3240027464737370705==--

